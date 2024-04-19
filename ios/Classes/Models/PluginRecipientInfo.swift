//
//  PluginRecipientInfo.swift
//  ecmpplugin
//
//  Created by Alex on 19.04.2024.
//

import Foundation


internal struct PluginRecipientInfo: Decodable {
    let walletOwner: String?
    let walletId: String?
    let country: String?
    let pan: String?
    let cardHolder: String?
    let address: String?
    let city: String?
    let stateCode: String?
}
