package com.ecommpay.flutterplugin.models

import kotlinx.serialization.Serializable

@Serializable
internal data class PluginRecurrentData(
    val register: Boolean,
    val type: String?,
    val expiryDay: String?,
    val expiryMonth: String?,
    val expiryYear: String?,
    val period: String?,
    val interval: Int?,
    val time: String?,
    val startDate: String?,
    val scheduledPaymentID: String?,
    val amount: Long?,
    val schedule: List<PluginRecurrentDataSchedule>?,
)

@Serializable
internal data class PluginRecurrentDataSchedule(
    val date: String,
    val amount: Long,
)