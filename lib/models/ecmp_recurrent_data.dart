import 'package:json_annotation/json_annotation.dart';

part 'ecmp_recurrent_data.g.dart';

@JsonSerializable()
class EcmpRecurrentData {
  final bool register;

  /// Type of recurrent - R/C/U/I
  final EcmpRecurrentType? type;

  ///  Day of recurrent expiration, must be string(2) day in DD format
  final String? expiryDay;

  /// Month of recurrent expiration, must be string(2) month in MM format
  final String? expiryMonth;

  ///  Year of recurrent expiration, must be string(4) month in YYYY format
  final String? expiryYear;

  ///  Period of payment - Day/Week/Month/Quarter/Year
  final EcmpRecurrentPeriod? period;

  ///  Interval of payment: 1-100
  ///  (For example: period = W and interval = 3 - payment is every three weeks)
  final int? interval;

  /// Time of recurrent payment to charge
  final String? time;

  /// Date to start recurrent payment, must be string(10) in DD-MM-YYYY format
  final String? startDate;

  /// Payment ID, must be unique within your project
  final String? scheduledPaymentID;

  /// Amount of COF purchase. By default the amount of COF purchase is equal to payment amount
  final int? amount;

  /// Data and amount of COF purchase. By default the debit of funds is strictly fixed in time and amount
  final List<EcmpRecurrentDataSchedule>? schedule;

  EcmpRecurrentData({
    this.register = true,
    this.type,
    this.expiryDay,
    this.expiryMonth,
    this.expiryYear,
    this.period,
    this.interval,
    this.time,
    this.startDate,
    this.scheduledPaymentID,
    this.amount,
    this.schedule,
  });

  Map<String, dynamic> toJson() => _$EcmpRecurrentDataToJson(this);

  factory EcmpRecurrentData.fromJson(Map<String, dynamic> data) =>
      _$EcmpRecurrentDataFromJson(data);
}

@JsonSerializable()
class EcmpRecurrentDataSchedule {
  ///  Date of charge in format DD-MM-YYYY
  final String? date;

  /// Amount to charge, 1000 = 10.00
  final int? amount;

  EcmpRecurrentDataSchedule({
    this.date,
    this.amount,
  });

  Map<String, dynamic> toJson() => _$EcmpRecurrentDataScheduleToJson(this);

  factory EcmpRecurrentDataSchedule.fromJson(Map<String, dynamic> data) =>
      _$EcmpRecurrentDataScheduleFromJson(data);
}

enum EcmpRecurrentType {
  @JsonValue("R")
  Regular,
  @JsonValue("C")
  OneClick,
  @JsonValue("U")
  Autopayment
}

enum EcmpRecurrentPeriod {
  @JsonValue("D")
  Day,
  @JsonValue("W")
  Week,
  @JsonValue("M")
  Month,
  @JsonValue("Q")
  Quarter,
  @JsonValue("Y")
  Year
}
