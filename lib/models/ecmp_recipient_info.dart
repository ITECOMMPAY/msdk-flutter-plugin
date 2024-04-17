import 'package:json_annotation/json_annotation.dart';

part 'ecmp_recipient_info.g.dart';

@JsonSerializable()
class EcmpRecipientInfo {
  final String? walletOwner;
  final String? walletId;
  final String? country;
  final String? pan;
  final String? cardHolder;
  final String? address;
  final String? city;
  final String? stateCode;

  EcmpRecipientInfo({
    this.walletOwner,
    this.walletId,
    this.country,
    this.pan,
    this.cardHolder,
    this.address,
    this.city,
    this.stateCode,
  });

  Map<String, dynamic> toJson() => _$EcmpRecipientInfoToJson(this);

  factory EcmpRecipientInfo.fromJson(Map<String, dynamic> data) =>
      _$EcmpRecipientInfoFromJson(data);
}
