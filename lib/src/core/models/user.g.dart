// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      passwordHash: json['passwordHash'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      coachId: (json['coachId'] as num?)?.toInt(),
      isEmailVerified: json['isEmailVerified'] as bool?,
      verificationToken: json['verificationToken'] as String?,
      resetPasswordToken: json['resetPasswordToken'] as String?,
    )..coverImageUrl = json['coverImageUrl'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'passwordHash': instance.passwordHash,
      'profileImageUrl': instance.profileImageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'coachId': instance.coachId,
      'isEmailVerified': instance.isEmailVerified,
      'verificationToken': instance.verificationToken,
      'resetPasswordToken': instance.resetPasswordToken,
      'coverImageUrl': instance.coverImageUrl,
    };
