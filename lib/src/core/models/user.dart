import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? passwordHash;
  String? profileImageUrl;
  DateTime? createdAt;
  DateTime? lastLogin;
  int? coachId;
  bool? isEmailVerified;
  String? verificationToken;
  String? resetPasswordToken;
  String? coverImageUrl;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.passwordHash,
    this.profileImageUrl,
    this.createdAt,
    this.lastLogin,
    this.coachId,
    this.isEmailVerified,
    this.verificationToken,
    this.resetPasswordToken
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
