//
//  PluginRecurrentData.swift
//  ecmpplugin
//
//  Created by Alex on 19.04.2024.
//

import Foundation


internal struct PluginRecurrentData: Decodable {
    let register: Bool
    let type: String?
    let expiryDay: String?
    let expiryMonth: String?
    let expiryYear: String?
    let period: String?
    let interval: Int?
    let time: String?
    let startDate: String?
    let scheduledPaymentID: String?
    let amount: Int64?
    let schedule: [PluginRecurrentDataSchedule]?
}


internal struct PluginRecurrentDataSchedule: Decodable {
    let date: String
    let amount: Int
}
