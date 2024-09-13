import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
class RefreshTokenDto {
  String? refresh_token;

  RefreshTokenDto({
    this.refresh_token,
  });

  factory RefreshTokenDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenDtoToJson(this);
}