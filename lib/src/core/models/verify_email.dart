import 'package:json_annotation/json_annotation.dart';

part 'verify_email.g.dart';

@JsonSerializable()
class VerifyEmailDto {
  String? token;

  VerifyEmailDto({
    this.token,
  });

  factory VerifyEmailDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailDtoToJson(this);
}