// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_payment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpPaymentOptions _$EcmpPaymentOptionsFromJson(Map<String, dynamic> json) =>
    EcmpPaymentOptions(
      actionType: $enumDecode(_$EcmpActionTypeEnumMap, json['actionType']),
      paymentInfo:
          EcmpPaymentInfo.fromJson(json['paymentInfo'] as Map<String, dynamic>),
      recipientInfo: json['recipientInfo'] == null
          ? null
          : EcmpRecipientInfo.fromJson(
              json['recipientInfo'] as Map<String, dynamic>),
      recurrentData: json['recurrentData'] == null
          ? null
          : EcmpRecurrentData.fromJson(
              json['recurrentData'] as Map<String, dynamic>),
      additionalFields: (json['additionalFields'] as List<dynamic>?)
          ?.map((e) => EcmpAdditionalField.fromJson(e as Map<String, dynamic>))
          .toList(),
      screenDisplayModes: (json['screenDisplayModes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EcmpScreenDisplayModeEnumMap, e))
          .toList(),
      hideScanningCards: json['hideScanningCards'] as bool?,
      googleMerchantId: json['googleMerchantId'] as String?,
      googleMerchantName: json['googleMerchantName'] as String?,
      googleIsTestEnvironment: json['googleIsTestEnvironment'] as bool?,
      applePayMerchantId: json['applePayMerchantId'] as String?,
      applePayDescription: json['applePayDescription'] as String?,
      applePayCountryCode: json['applePayCountryCode'] as String?,
      isDarkTheme: json['isDarkTheme'] as bool,
      brandColor: json['brandColor'] as String?,
      storedCardType: json['storedCardType'] as int?,
      mockModeType:
          $enumDecode(_$EcmpMockModeTypeEnumMap, json['mockModeType']),
    );

Map<String, dynamic> _$EcmpPaymentOptionsToJson(EcmpPaymentOptions instance) =>
    <String, dynamic>{
      'actionType': _$EcmpActionTypeEnumMap[instance.actionType]!,
      'paymentInfo': instance.paymentInfo,
      'recipientInfo': instance.recipientInfo,
      'recurrentData': instance.recurrentData,
      'hideScanningCards': instance.hideScanningCards,
      'additionalFields': instance.additionalFields,
      'screenDisplayModes': instance.screenDisplayModes
          ?.map((e) => _$EcmpScreenDisplayModeEnumMap[e]!)
          .toList(),
      'googleMerchantId': instance.googleMerchantId,
      'googleMerchantName': instance.googleMerchantName,
      'googleIsTestEnvironment': instance.googleIsTestEnvironment,
      'applePayMerchantId': instance.applePayMerchantId,
      'applePayDescription': instance.applePayDescription,
      'applePayCountryCode': instance.applePayCountryCode,
      'isDarkTheme': instance.isDarkTheme,
      'brandColor': instance.brandColor,
      'storedCardType': instance.storedCardType,
      'mockModeType': _$EcmpMockModeTypeEnumMap[instance.mockModeType]!,
    };

const _$EcmpActionTypeEnumMap = {
  EcmpActionType.Sale: 'Sale',
  EcmpActionType.Auth: 'Auth',
  EcmpActionType.Tokenize: 'Tokenize',
  EcmpActionType.Verify: 'Verify',
};

const _$EcmpScreenDisplayModeEnumMap = {
  EcmpScreenDisplayMode.HIDE_SUCCESS_FINAL_SCREEN: 'HIDE_SUCCESS_FINAL_SCREEN',
  EcmpScreenDisplayMode.HIDE_DECLINE_FINAL_SCREEN: 'HIDE_DECLINE_FINAL_SCREEN',
  EcmpScreenDisplayMode.DEFAULT: 'DEFAULT',
};

const _$EcmpMockModeTypeEnumMap = {
  EcmpMockModeType.DISABLED: 'DISABLED',
  EcmpMockModeType.SUCCESS: 'SUCCESS',
  EcmpMockModeType.DECLINE: 'DECLINE',
};
