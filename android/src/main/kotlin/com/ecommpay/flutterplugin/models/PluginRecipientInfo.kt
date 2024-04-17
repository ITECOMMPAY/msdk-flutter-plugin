package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginRecipientInfo(
    val walletOwner: String? = null,
    val walletId: String? = null,
    val country: String? = null,
    val pan: String? = null,
    val cardHolder: String? = null,
    val address: String? = null,
    val city: String? = null,
    val stateCode: String? = null,
)