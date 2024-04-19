package com.ecommpay.flutterplugin

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull
import com.ecommpay.flutterplugin.models.PluginPayment
import com.ecommpay.flutterplugin.models.PluginPaymentInfo
import com.ecommpay.flutterplugin.models.PluginPaymentOptions
import com.ecommpay.flutterplugin.models.PluginResult
import com.ecommpay.msdk.ui.EcmpActionType
import com.ecommpay.msdk.ui.EcmpAdditionalFieldType
import com.ecommpay.msdk.ui.EcmpPaymentSDK
import com.ecommpay.msdk.ui.EcmpRecipientInfo
import com.ecommpay.msdk.ui.EcmpRecurrentData
import com.ecommpay.msdk.ui.EcmpRecurrentDataSchedule
import com.ecommpay.msdk.ui.EcmpScreenDisplayMode
import com.ecommpay.msdk.ui.paymentOptions
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import kotlinx.serialization.json.Json
import java.lang.ref.WeakReference

/** EcmpPlugin */
class EcmpPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activityReference = WeakReference<Activity>(null)
    private var contextReference = WeakReference<Context>(null)
    private var result: Result? = null
    private val serializer = Json {
        isLenient = true
        ignoreUnknownKeys = true
        allowSpecialFloatingPointValues = true
        explicitNulls = false
        encodeDefaults = true
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ecmpplugin")
        channel.setMethodCallHandler(this)
        contextReference = WeakReference(flutterPluginBinding.applicationContext)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityReference = WeakReference(binding.activity)
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityReference.clear()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityReference = WeakReference(binding.activity)
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activityReference.clear()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val json = call.arguments as String
        if (call.method == "sdkRun" && json.isNotEmpty()) {
            sdkRun(json = json, result = result)
        } else if (call.method == "getParamsForSignature" && json.isNotEmpty()) {
            getParamsForSignature(json = json, result = result)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun getParamsForSignature(json: String, result: Result) {
        val pluginPaymentInfo =
            serializer.decodeFromString(PluginPaymentInfo.serializer(), json)
        val ecmpPaymentInfo = pluginPaymentInfo.map()
        val paramsForSignature = ecmpPaymentInfo.getParamsForSignature()
        result.success(paramsForSignature)
    }

    private fun sdkRun(json: String, result: Result) {
        val pluginPaymentOptions =
            serializer.decodeFromString(PluginPaymentOptions.serializer(), json)
        //1. Create EcmpPaymentInfo object
        val ecmpPaymentInfo = pluginPaymentOptions.paymentInfo.map()
        //2. Configure SDK
        val paymentOptions = paymentOptions {
            paymentInfo = ecmpPaymentInfo
            actionType = EcmpActionType.valueOf(pluginPaymentOptions.actionType.name)
            //GooglePay options
            isTestEnvironment = pluginPaymentOptions.googleIsTestEnvironment ?: true
            merchantId = pluginPaymentOptions.googleMerchantId ?: ""
            merchantName = pluginPaymentOptions.googleMerchantName ?: ""
            additionalFields {
                pluginPaymentOptions.additionalFields?.forEach { field ->
                    field {
                        type = EcmpAdditionalFieldType.entries.find { it.value == field.type }
                        value = field.value
                    }
                }
            }
            screenDisplayModes {
                pluginPaymentOptions.screenDisplayModes?.forEach {
                    mode(EcmpScreenDisplayMode.valueOf(it.name))
                }
            }
            if (pluginPaymentOptions.recipientInfo != null)
                recipientInfo = EcmpRecipientInfo(
                    walletOwner = pluginPaymentOptions.recipientInfo.walletOwner,
                    walletId = pluginPaymentOptions.recipientInfo.walletId,
                    country = pluginPaymentOptions.recipientInfo.country,
                    pan = pluginPaymentOptions.recipientInfo.pan,
                    cardHolder = pluginPaymentOptions.recipientInfo.cardHolder,
                    address = pluginPaymentOptions.recipientInfo.address,
                    city = pluginPaymentOptions.recipientInfo.city,
                    stateCode = pluginPaymentOptions.recipientInfo.stateCode,
                )
            if (pluginPaymentOptions.recurrentData != null)
                recurrentData = EcmpRecurrentData(
                    register = pluginPaymentOptions.recurrentData.register,
                    type = pluginPaymentOptions.recurrentData.type?.value,
                    expiryDay = pluginPaymentOptions.recurrentData.expiryDay,
                    expiryMonth = pluginPaymentOptions.recurrentData.expiryMonth,
                    expiryYear = pluginPaymentOptions.recurrentData.expiryYear,
                    period = pluginPaymentOptions.recurrentData.period?.value,
                    interval = pluginPaymentOptions.recurrentData.interval,
                    time = pluginPaymentOptions.recurrentData.time,
                    startDate = pluginPaymentOptions.recurrentData.startDate,
                    scheduledPaymentID = pluginPaymentOptions.recurrentData.scheduledPaymentID,
                    amount = pluginPaymentOptions.recurrentData.amount,
                    schedule = pluginPaymentOptions.recurrentData.schedule?.map {
                        EcmpRecurrentDataSchedule(
                            date = it.date,
                            amount = it.amount
                        )
                    }

                )
            //Parameter to enable hiding or displaying scanning cards feature
            hideScanningCards = pluginPaymentOptions.hideScanningCards ?: false
            isDarkTheme = pluginPaymentOptions.isDarkTheme
        }

        contextReference.get()?.let { context ->
            //4. Create sdk object
            val sdk = EcmpPaymentSDK(
                context = context,
                paymentOptions = paymentOptions,
                mockModeType = EcmpPaymentSDK.EcmpMockModeType.valueOf(pluginPaymentOptions.mockModeType.name)
            )
            this.result = result
            activityReference.get()?.startActivityForResult(sdk.intent, 100)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        when (resultCode) {
            EcmpPaymentSDK.RESULT_SUCCESS -> {
                val paymentJson = data?.getStringExtra(EcmpPaymentSDK.EXTRA_PAYMENT)
                result?.success(
                    serializer.encodeToString(
                        PluginResult.serializer(),
                        PluginResult(
                            resultCode = resultCode,
                            payment = paymentJson?.let {
                                serializer.decodeFromString<PluginPayment>(it)
                            }
                        )
                    )
                )
            }

            EcmpPaymentSDK.RESULT_ERROR -> {
                val errorCode = data?.getStringExtra(EcmpPaymentSDK.EXTRA_ERROR_CODE)
                val errorMessage = data?.getStringExtra(EcmpPaymentSDK.EXTRA_ERROR_MESSAGE)
                result?.success(
                    serializer.encodeToString(
                        PluginResult.serializer(),
                        PluginResult(
                            resultCode = resultCode,
                            errorCode = errorCode,
                            errorMessage = errorMessage
                        )
                    )
                )
            }

            else -> {
                result?.success(
                    serializer.encodeToString(
                        PluginResult.serializer(),
                        PluginResult(resultCode = resultCode)
                    )
                )
            }
        }

        result = null
        return false
    }
}
