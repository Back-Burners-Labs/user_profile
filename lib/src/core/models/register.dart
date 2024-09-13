import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterDto {
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? profileImageUrl;

  RegisterDto({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.profileImageUrl,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}