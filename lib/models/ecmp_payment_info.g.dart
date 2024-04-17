// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_payment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpPaymentInfo _$EcmpPaymentInfoFromJson(Map<String, dynamic> json) =>
    EcmpPaymentInfo(
      projectId: json['projectId'] as int,
      paymentId: json['paymentId'] as String,
      paymentAmount: json['paymentAmount'] as int,
      paymentCurrency: json['paymentCurrency'] as String,
      paymentDescription: json['paymentDescription'] as String?,
      customerId: json['customerId'] as String?,
      regionCode: json['regionCode'] as String?,
      token: json['token'] as String?,
      languageCode: json['languageCode'] as String?,
      receiptData: json['receiptData'] as String?,
      hideSavedWallets: json['hideSavedWallets'] as bool?,
      forcePaymentMethod: json['forcePaymentMethod'] as String?,
    )..signature = json['signature'] as String?;

Map<String, dynamic> _$EcmpPaymentInfoToJson(EcmpPaymentInfo instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'paymentId': instance.paymentId,
      'paymentAmount': instance.paymentAmount,
      'paymentCurrency': instance.paymentCurrency,
      'paymentDescription': instance.paymentDescription,
      'customerId': instance.customerId,
      'regionCode': instance.regionCode,
      'token': instance.token,
      'languageCode': instance.languageCode,
      'receiptData': instance.receiptData,
      'hideSavedWallets': instance.hideSavedWallets,
      'forcePaymentMethod': instance.forcePaymentMethod,
      'signature': instance.signature,
    };
