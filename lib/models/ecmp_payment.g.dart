// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpPayment _$EcmpPaymentFromJson(Map<String, dynamic> json) => EcmpPayment(
      json['id'] as String,
      json['status'] as String,
      json['method'] as String,
      json['sum'] as int,
      json['type'] as String?,
      json['token'] as String?,
      json['currency'] as String?,
      json['paymentMassage'] as String?,
    );

Map<String, dynamic> _$EcmpPaymentToJson(EcmpPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'method': instance.method,
      'sum': instance.sum,
      'type': instance.type,
      'token': instance.token,
      'currency': instance.currency,
      'paymentMassage': instance.paymentMassage,
    };
