// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_plugin_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpPluginResult _$EcmpPluginResultFromJson(Map<String, dynamic> json) =>
    EcmpPluginResult(
      json['resultCode'] as int,
      json['payment'] == null
          ? null
          : EcmpPayment.fromJson(json['payment'] as Map<String, dynamic>),
      json['errorCode'] as String?,
      json['errorMessage'] as String?,
    );

Map<String, dynamic> _$EcmpPluginResultToJson(EcmpPluginResult instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'payment': instance.payment,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };
