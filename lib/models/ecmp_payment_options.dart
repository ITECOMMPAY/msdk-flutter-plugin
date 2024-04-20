import 'package:json_annotation/json_annotation.dart';

import 'ecmp_additional_field.dart';
import 'ecmp_payment_info.dart';
import 'ecmp_recipient_info.dart';
import 'ecmp_recurrent_data.dart';

part 'ecmp_payment_options.g.dart';

@JsonSerializable()
class EcmpPaymentOptions {
  // payment configuration
  final EcmpActionType actionType;
  final EcmpPaymentInfo paymentInfo;
  final EcmpRecipientInfo? recipientInfo;
  final EcmpRecurrentData? recurrentData;
  final bool? hideScanningCards;
  final List<EcmpAdditionalField>? additionalFields;
  final List<EcmpScreenDisplayMode>? screenDisplayModes;

  // google pay configuration
  final String? googleMerchantId;
  final String? googleMerchantName;
  final bool? googleIsTestEnvironment;

  //apple pay configuration
  final String? applePayMerchantId;
  final String? applePayDescription;
  final String? applePayCountryCode;

  // theme customization
  final bool isDarkTheme;
  final String? brandColor;
  final int? storedCardType;

  //mock mode
  final EcmpMockModeType mockModeType;

  EcmpPaymentOptions({
    required this.actionType,
    required this.paymentInfo,
    this.recipientInfo,
    this.recurrentData,
    this.additionalFields,
    this.screenDisplayModes,
    this.hideScanningCards,
    this.googleMerchantId,
    this.googleMerchantName,
    this.googleIsTestEnvironment,
    this.applePayMerchantId,
    this.applePayDescription,
    this.applePayCountryCode,
    required this.isDarkTheme,
    this.brandColor,
    this.storedCardType,
    required this.mockModeType,
  });

  Map<String, dynamic> toJson() => _$EcmpPaymentOptionsToJson(this);

  factory EcmpPaymentOptions.fromJson(Map<String, dynamic> data) =>
      _$EcmpPaymentOptionsFromJson(data);
}

enum EcmpMockModeType {
  @JsonValue("DISABLED")
  disabled,
  @JsonValue("SUCCESS")
  success,
  @JsonValue("DECLINE")
  decline
}

enum EcmpActionType {
  @JsonValue("Sale")
  sale,
  @JsonValue("Auth")
  auth,
  @JsonValue("Tokenize")
  tokenize,
  @JsonValue("Verify")
  verify
}

enum EcmpScreenDisplayMode {
  @JsonValue("HIDE_SUCCESS_FINAL_SCREEN")
  hideSuccessFinalScreen,
  @JsonValue("HIDE_DECLINE_FINAL_SCREEN")
  hideDeclineFinalScreen
}
