import 'package:json_annotation/json_annotation.dart';

import 'ecmp_additional_field.dart';

part 'ecmp_payment_info.g.dart';

@JsonSerializable()
class EcmpPaymentInfo {
  /// project (merchant) ID
  final int projectId;
  /// must be unique within the project
  final String paymentId;
  /// payment amount in minor currency units
  final int paymentAmount;
  /// payment currency code according to ISO-4217 alpha-3
  final String paymentCurrency;
  /// payment description (this parameter is available not only to the merchant, but also to the customer; if paymentDescription is specified in the request, it is visible to the customer in the payment form (in the dialog box containing information about the payment); if this parameter is not specified in the request, it is not visible to the customer)
  final String? paymentDescription;
  final String? customerId;
  final String? regionCode;
  final String? token;
  final String? languageCode;
  final String? receiptData;
  /// hiding or displaying saved payment instruments in the payment form
  final bool? hideSavedWallets;
  /// the identifier of the payment method which is opened to the customer without an option for the customer to select another payment method. The list of codes is provided in the IDs of payment methods supported on Payment Page section
  final String? forcePaymentMethod;
  String? signature;

  EcmpPaymentInfo({
    required this.projectId,
    required this.paymentId,
    required this.paymentAmount,
    required this.paymentCurrency,
    this.paymentDescription,
    this.customerId,
    this.regionCode,
    this.token,
    this.languageCode,
    this.receiptData,
    this.hideSavedWallets,
    this.forcePaymentMethod,
  });

  Map<String, dynamic> toJson() => _$EcmpPaymentInfoToJson(this);

  factory EcmpPaymentInfo.fromJson(Map<String, dynamic> data) =>
      _$EcmpPaymentInfoFromJson(data);
}
