package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginPayment(
    val id: String,
    val status: String,
    val paymentMethodType: String,
    val sum: Int,
    val type: String? = null,
    val token: String? = null,
    val currency: String? = null,
    val paymentMassage: String? = null,
)