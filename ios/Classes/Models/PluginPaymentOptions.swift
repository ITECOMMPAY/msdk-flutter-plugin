//
//  PluginPaymentOptions.swift
//  ecmpplugin
//
//  Created by Alex on 18.04.2024.
//

import Foundation
import ecommpaySDK


internal enum PluginActionType: String, Decodable {
    case Sale, Auth, Tokenize, Verify
    
    func map() ->  PaymentOptions.ActionType  {
        if (self == PluginActionType.Auth) {
            return PaymentOptions.ActionType.Auth
        } else if (self == PluginActionType.Tokenize) {
            return PaymentOptions.ActionType.Tokenize
        } else if (self == PluginActionType.Verify) {
            return PaymentOptions.ActionType.Verify
        } else {
            return PaymentOptions.ActionType.Sale
        }
    }
}

internal enum PluginMockModeType: String, Decodable {
    case  DISABLED, SUCCESS, DECLINE
    
    func map() -> MockModeType  {
        if (self == PluginMockModeType.SUCCESS) {
            return MockModeType.success
        } else if (self == PluginMockModeType.DECLINE) {
            return MockModeType.decline
        } else {
            return MockModeType.disabled
        }
    }
}

internal enum PluginScreenDisplayMode: String, Decodable {
    case HIDE_SUCCESS_FINAL_SCREEN, HIDE_DECLINE_FINAL_SCREEN
    
    func map() -> ScreenDisplayMode  {
        if (self == PluginScreenDisplayMode.HIDE_SUCCESS_FINAL_SCREEN) {
            return ScreenDisplayMode.hideDeclineFinalPage
        } else {
            return ScreenDisplayMode.hideDeclineFinalPage
        }
    }
}


internal struct PluginPaymentOptions: Decodable {
    let actionType: PluginActionType
    let paymentInfo: PluginPaymentInfo
    let recurrentData: PluginRecurrentData?
    let recipientInfo: PluginRecipientInfo?
    let additionalFields: [PluginAdditionalField]?
    let screenDisplayModes: [PluginScreenDisplayMode]?
    let mockModeType: PluginMockModeType
    let hideScanningCards: Bool?
    let applePayMerchantId: String?
    let applePayDescription: String?
    let applePayCountryCode: String?
    let isDarkTheme: Bool?
    let brandColor: String?
    let storedCardType: Int?
}
