import 'package:ecmpplugin/models/ecmp_payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ecmp_plugin_result.g.dart';

@JsonSerializable()
class EcmpPluginResult {
  final int resultCode;
  final EcmpPayment? payment;
  final String? errorCode;
  final String? errorMessage;

  EcmpPluginResult(
      this.resultCode, this.payment, this.errorCode, this.errorMessage);

  Map<String, dynamic> toJson() => _$EcmpPluginResultToJson(this);

  factory EcmpPluginResult.fromJson(Map<String, dynamic> data) =>
      _$EcmpPluginResultFromJson(data);
}
