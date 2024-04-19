//
//  PluginPaymentInfo.swift
//  ecmpplugin
//
//  Created by Alex on 18.04.2024.
//

import Foundation
import ecommpaySDK

internal struct PluginPaymentInfo: Decodable {
    let projectId: Int32
    let paymentId: String
    let paymentAmount: Int64
    let paymentCurrency: String
    let paymentDescription: String?
    let customerId: String?
    let regionCode: String?
    let token: String?
    let languageCode: String?
    let receiptData: String?
    let forcePaymentMethod: String?
    let hideSavedWallets: Bool?
    let signature: String?
    
    func map() -> PaymentOptions {
        let paymentOptions = PaymentOptions(projectID: projectId,
                                            paymentID: paymentId,
                                            paymentAmount: paymentAmount,
                                            paymentCurrency: paymentCurrency,
                                            paymentDescription: paymentDescription,
                                            customerID: customerId, // unique ID assigned to your customer
                                            regionCode: regionCode,
                                            token: token)
        paymentOptions.receiptData = receiptData
        paymentOptions.languageCode = languageCode
        paymentOptions.forcePaymentMethod = forcePaymentMethod
        paymentOptions.hideSavedWallets = hideSavedWallets ?? false
        paymentOptions.signature = signature
        
        return paymentOptions
    }
}
