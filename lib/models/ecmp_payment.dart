import 'package:json_annotation/json_annotation.dart';

part 'ecmp_payment.g.dart';

@JsonSerializable()
class EcmpPayment {
  final String id;
  final String status;
  final String paymentMethodType;
  final int sum;
  final String? type;
  final String? token;
  final String? currency;
  final String? paymentMassage;

  EcmpPayment(this.id, this.status, this.paymentMethodType, this.sum, this.type,
      this.token, this.currency, this.paymentMassage);

  Map<String, dynamic> toJson() => _$EcmpPaymentToJson(this);

  factory EcmpPayment.fromJson(Map<String, dynamic> data) =>
      _$EcmpPaymentFromJson(data);
}
