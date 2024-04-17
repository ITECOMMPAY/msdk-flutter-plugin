package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginResult(
    val resultCode: Int,
    val payment: PluginPayment? = null,
    val errorCode: String? = null,
    val errorMessage: String? = null
)