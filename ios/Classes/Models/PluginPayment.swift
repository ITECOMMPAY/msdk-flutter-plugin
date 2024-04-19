//
//  PluginPayment.swift
//  ecmpplugin
//
//  Created by Alex on 19.04.2024.
//

import Foundation

internal struct PluginPayment: Decodable, Encodable {
    let id: String
    let status: String
    let paymentMethodType: String
    let sum: Int64
    let type: String?
    let token: String?
    let currency: String?
    let paymentMassage: String?
}
