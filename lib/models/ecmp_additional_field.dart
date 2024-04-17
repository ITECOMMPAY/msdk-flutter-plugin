import 'package:json_annotation/json_annotation.dart';

part 'ecmp_additional_field.g.dart';

@JsonSerializable()
class EcmpAdditionalField {
  final String type;
  final String value;

  EcmpAdditionalField({required this.type, required this.value});

  Map<String, dynamic> toJson() => _$EcmpAdditionalFieldToJson(this);

  factory EcmpAdditionalField.fromJson(Map<String, dynamic> data) =>
      _$EcmpAdditionalFieldFromJson(data);
}
