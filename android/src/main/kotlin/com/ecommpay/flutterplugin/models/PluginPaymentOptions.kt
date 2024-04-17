package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginPaymentOptions(
    var actionType: PluginActionType,
    val paymentInfo: PluginPaymentInfo,
    val recurrentData: PluginRecurrentData?,
    val recipientInfo: PluginRecipientInfo?,
    val additionalFields: List<PluginAdditionalField>?,
    val screenDisplayModes: List<PluginScreenDisplayMode>?,
    val hideScanningCards: Boolean?,
    //google pay configuration
    val googleMerchantId: String?,
    val googleMerchantName: String?,
    val googleIsTestEnvironment: Boolean?,
    //theme customization
    val isDarkTheme: Boolean,
    val brandColor: String?,
    val footerLabel: String?,
    val storedCardType: Int?,
    //
    val mockModeType: PluginMockModeType
)

@Serializable
internal enum class PluginMockModeType {
    DISABLED, SUCCESS, DECLINE
}

@Serializable
internal enum class PluginActionType {
    Sale, Auth, Tokenize, Verify
}

@Serializable
internal enum class PluginScreenDisplayMode {
    HIDE_SUCCESS_FINAL_SCREEN,
    HIDE_DECLINE_FINAL_SCREEN,
    DEFAULT
}