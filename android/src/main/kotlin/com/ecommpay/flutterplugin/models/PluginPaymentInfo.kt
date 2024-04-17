package com.ecommpay.flutterplugin.models

import com.ecommpay.msdk.ui.EcmpPaymentInfo
import kotlinx.serialization.Serializable

@Serializable
internal data class PluginPaymentInfo(
    val projectId: Int,
    val paymentId: String,
    val paymentAmount: Long,
    val paymentCurrency: String,
    val paymentDescription: String?,
    val customerId: String?,
    val regionCode: String?,
    val token: String?,
    val receiptData: String?,
    val languageCode: String?,
    val hideSavedWallets: Boolean?,
    val forcePaymentMethod: String?,
    val signature: String?,
) {
    fun map() = EcmpPaymentInfo(
        projectId = this.projectId,
        paymentId = this.paymentId,
        paymentAmount = this.paymentAmount,
        paymentCurrency = this.paymentCurrency,
        //optional fields
        paymentDescription = this.paymentDescription,
        customerId = this.customerId,
        regionCode = this.regionCode,
        token = this.token,
        languageCode = this.languageCode,
        receiptData = this.receiptData,
        hideSavedWallets = this.hideSavedWallets ?: false,
        forcePaymentMethod = this.forcePaymentMethod,
        signature = this.signature,
    )
}