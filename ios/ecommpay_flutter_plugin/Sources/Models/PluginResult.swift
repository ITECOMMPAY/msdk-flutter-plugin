//
//  PluginResult.swift
//  ecmpplugin
//
//  Created by Alex on 19.04.2024.
//

import Foundation

internal struct PluginResult: Decodable, Encodable {
    let resultCode: Int
    let payment: PluginPayment?
    let errorCode: String?
    let errorMessage: String?
}
