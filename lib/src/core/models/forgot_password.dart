import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class ForgotPasswordDto {
  String? email;

  ForgotPasswordDto({
    this.email,
  });

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordDtoToJson(this);
}