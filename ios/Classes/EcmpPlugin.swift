import Flutter
import UIKit
import ecommpaySDK

public class EcmpPlugin: NSObject, FlutterPlugin {
    
    private let ecompaySDK = EcommpaySDK()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "ecmpplugin", binaryMessenger: registrar.messenger())
        let instance = EcmpPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let json = call.arguments as? String else{
            result(FlutterMethodNotImplemented)
            return
        }
        switch call.method {
            case "sdkRun":
                sdkRun(json: json, result: result)
            case "getParamsForSignature":
                getParamsForSignature(json: json, result: result)
            default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    private func getParamsForSignature(json: String, result: @escaping FlutterResult) {
        let jsonData = json.data(using: .utf8)!
        let paymentInfo: PluginPaymentInfo = try! JSONDecoder().decode(PluginPaymentInfo.self, from: jsonData)
        let paramsForSignature = paymentInfo.map().paramsForSignature
        result(paramsForSignature)
    }
    
    private func sdkRun(json: String, result: @escaping FlutterResult) {
        guard let controller = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController else {
            return
        }
        
        let jsonData = json.data(using: .utf8)!
        let pluginPaymentOptions: PluginPaymentOptions = try! JSONDecoder().decode(PluginPaymentOptions.self, from: jsonData)
        
        
        let paymentOptions = PaymentOptions(projectID: pluginPaymentOptions.paymentInfo.projectId,
                                            paymentID: pluginPaymentOptions.paymentInfo.paymentId,
                                            paymentAmount: pluginPaymentOptions.paymentInfo.paymentAmount,
                                            paymentCurrency: pluginPaymentOptions.paymentInfo.paymentCurrency,
                                            paymentDescription: pluginPaymentOptions.paymentInfo.paymentDescription,
                                            customerID: pluginPaymentOptions.paymentInfo.customerId,
                                            regionCode: pluginPaymentOptions.paymentInfo.regionCode)
        
        paymentOptions.action = pluginPaymentOptions.actionType.map()
        paymentOptions.receiptData = pluginPaymentOptions.paymentInfo.receiptData
        paymentOptions.languageCode = pluginPaymentOptions.paymentInfo.languageCode
        paymentOptions.forcePaymentMethod = pluginPaymentOptions.paymentInfo.forcePaymentMethod
        paymentOptions.hideSavedWallets = pluginPaymentOptions.paymentInfo.hideSavedWallets ?? false
        paymentOptions.signature = pluginPaymentOptions.paymentInfo.signature
        paymentOptions.additionalFields = pluginPaymentOptions.additionalFields?.map({ field in
            AdditionalField(customName: field.type, value: field.value)
        })
        paymentOptions.mockModeType = pluginPaymentOptions.mockModeType.map()
        paymentOptions.screenDisplayModes = Set(pluginPaymentOptions.screenDisplayModes?.map({ mode in
            mode.map()
        }) ?? [] )
        paymentOptions.hideSavedWallets = pluginPaymentOptions.hideScanningCards ?? false
        paymentOptions.hideSavedWallets = pluginPaymentOptions.paymentInfo.hideSavedWallets ?? false
        paymentOptions.isDarkThemeOn = pluginPaymentOptions.isDarkTheme ?? false
        paymentOptions.brandColor = pluginPaymentOptions.brandColor != nil ? UIColor(hex: pluginPaymentOptions.brandColor!) : nil
        paymentOptions.storedCardType = pluginPaymentOptions.storedCardType != nil ? NSNumber(value: pluginPaymentOptions.storedCardType!) : nil
        
        
        if let recurrentData  = pluginPaymentOptions.recurrentData {
            paymentOptions.recurrentInfo = RecurrentInfo(
                register: recurrentData.register,
                type: recurrentData.type != nil ? RecurrentType(rawValue: recurrentData.type!) : nil,
                expiryDay: recurrentData.expiryDay,
                expiryMonth: recurrentData.expiryMonth,
                expiryYear: recurrentData.expiryYear,
                period: recurrentData.period != nil ? RecurrentPeriod(rawValue: recurrentData.period!) : nil,
                interval: recurrentData.interval,
                time: recurrentData.time,
                startDate: recurrentData.startDate,
                scheduledPaymentID: recurrentData.scheduledPaymentID,
                schedule: recurrentData.schedule?.map({ item in
                    RecurrentInfoSchedule(date: item.date, amount: item.amount)
                })
             )
        }
        
        
        if let applePayCountryCode = pluginPaymentOptions.applePayCountryCode,
           let applePayMerchantId = pluginPaymentOptions.applePayMerchantId,
           let applePayDescription = pluginPaymentOptions.applePayDescription {
            paymentOptions.applePayOptions =  PaymentOptions.ApplePayOptions(applePayMerchantID: applePayMerchantId,
                                                                             applePayDescription: applePayDescription,
                                                                             countryCode: applePayCountryCode)
        }
        
        
        if let recipientInfo  = pluginPaymentOptions.recipientInfo {
            paymentOptions.recipientInfo = RecipientInfo(
                walletId: recipientInfo.walletId,
                walletOwner: recipientInfo.walletOwner,
                pan: recipientInfo.pan,
                cardHolder: recipientInfo.cardHolder,
                country: recipientInfo.country,
                stateCode: recipientInfo.stateCode,
                city: recipientInfo.city,
                address: recipientInfo.address
            )
        }
        
        ecompaySDK.presentPayment(at: controller, paymentOptions: paymentOptions) { sdkResult in
            
            let pluginResult = PluginResult(
                resultCode: sdkResult.status.rawValue,
                payment: sdkResult.payment != nil ? PluginPayment(
                    id: sdkResult.payment!.id ?? "",
                    status: sdkResult.payment!.status ?? "",
                    paymentMethodType: sdkResult.payment!.method ?? "",
                    sum: sdkResult.payment!.sum,
                    type: sdkResult.payment!.type,
                    token: sdkResult.payment!.token,
                    currency: sdkResult.payment!.currency,
                    paymentMassage: nil
                ) : nil,
                errorCode: sdkResult.error?.codeString,
                errorMessage: sdkResult.error?.message
            )
            
            let jsonData = try! JSONEncoder().encode(pluginResult)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)

            result(json)
        }
        
    }
    

}
