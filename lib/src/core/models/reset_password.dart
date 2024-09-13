import 'package:json_annotation/json_annotation.dart';

part 'reset_password.g.dart';

@JsonSerializable()
class ResetPasswordDto {
  String? token;
  String? password;

  ResetPasswordDto({
    this.token,
    this.password,
  });

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);
}