// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecmp_recurrent_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmpRecurrentData _$EcmpRecurrentDataFromJson(Map<String, dynamic> json) =>
    EcmpRecurrentData(
      register: json['register'] as bool? ?? true,
      type: $enumDecodeNullable(_$EcmpRecurrentTypeEnumMap, json['type']),
      expiryDay: json['expiryDay'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      period: $enumDecodeNullable(_$EcmpRecurrentPeriodEnumMap, json['period']),
      interval: json['interval'] as int?,
      time: json['time'] as String?,
      startDate: json['startDate'] as String?,
      scheduledPaymentID: json['scheduledPaymentID'] as String?,
      amount: json['amount'] as int?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) =>
              EcmpRecurrentDataSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EcmpRecurrentDataToJson(EcmpRecurrentData instance) =>
    <String, dynamic>{
      'register': instance.register,
      'type': _$EcmpRecurrentTypeEnumMap[instance.type],
      'expiryDay': instance.expiryDay,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'period': _$EcmpRecurrentPeriodEnumMap[instance.period],
      'interval': instance.interval,
      'time': instance.time,
      'startDate': instance.startDate,
      'scheduledPaymentID': instance.scheduledPaymentID,
      'amount': instance.amount,
      'schedule': instance.schedule,
    };

const _$EcmpRecurrentTypeEnumMap = {
  EcmpRecurrentType.Regular: 'Regular',
  EcmpRecurrentType.OneClick: 'OneClick',
  EcmpRecurrentType.Autopayment: 'Autopayment',
};

const _$EcmpRecurrentPeriodEnumMap = {
  EcmpRecurrentPeriod.Day: 'Day',
  EcmpRecurrentPeriod.Week: 'Week',
  EcmpRecurrentPeriod.Month: 'Month',
  EcmpRecurrentPeriod.Quarter: 'Quarter',
  EcmpRecurrentPeriod.Year: 'Year',
};

EcmpRecurrentDataSchedule _$EcmpRecurrentDataScheduleFromJson(
        Map<String, dynamic> json) =>
    EcmpRecurrentDataSchedule(
      date: json['date'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$EcmpRecurrentDataScheduleToJson(
        EcmpRecurrentDataSchedule instance) =>
    <String, dynamic>{
      'date': instance.date,
      'amount': instance.amount,
    };
