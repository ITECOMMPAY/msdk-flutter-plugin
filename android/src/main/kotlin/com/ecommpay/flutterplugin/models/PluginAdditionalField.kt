package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginAdditionalField(
    val type: String,
    val value: String,
)