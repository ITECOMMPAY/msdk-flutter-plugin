// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_recipient_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpRecipientInfo _$EcmpRecipientInfoFromJson(Map<String, dynamic> json) =>
    EcmpRecipientInfo(
      walletOwner: json['walletOwner'] as String?,
      walletId: json['walletId'] as String?,
      country: json['country'] as String?,
      pan: json['pan'] as String?,
      cardHolder: json['cardHolder'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      stateCode: json['stateCode'] as String?,
    );

Map<String, dynamic> _$EcmpRecipientInfoToJson(EcmpRecipientInfo instance) =>
    <String, dynamic>{
      'walletOwner': instance.walletOwner,
      'walletId': instance.walletId,
      'country': instance.country,
      'pan': instance.pan,
      'cardHolder': instance.cardHolder,
      'address': instance.address,
      'city': instance.city,
      'stateCode': instance.stateCode,
    };
