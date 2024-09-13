import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core/api/api_config.dart';
import '../../core/models/user.dart';
import '../../core/models/login.dart';
import '../../core/models/register.dart';
import '../../core/models/forgot_password.dart';
import '../../core/models/reset_password.dart';
import '../../core/models/verify_email.dart';
import '../../core/models/refresh_token.dart';
import '../utils/app_exceptions.dart';

class AuthApi {
  Dio get dio => ApiConfig.dio;

  Future<User> register(RegisterDto registerDto) async {
    final response = await dio.post(
      '/auth/register',
      data: registerDto.toJson(),
    );

    if (response.statusCode == 201) {
      return User.fromJson(response.data);
    } else {
      throw ApiException(
          statusCode: response.statusCode, message: 'Failed to register user');
    }
  }

  Future<User> signUpWithIdToken(String idToken) async {
    final response = await dio.post(
      '/auth/signup/id-token',
      data: jsonEncode({'idToken': idToken}),
    );

    if (response.statusCode == 201) {
      return User.fromJson(response.data);
    } else {
      throw ApiException(
          statusCode: response.statusCode, message: 'Failed to register user');
    }
  }

  Future<LoginResponse> login(LoginDto loginDto) async {
    final response = await dio.post(
      '/auth/login',
      data: loginDto.toJson(),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw ApiException(
          statusCode: response.statusCode, message: 'Failed to login user');
    }
  }

  Future<LoginResponse> signInWithIdToken(String idToken) async {
    final response = await dio.post(
      '/auth/signin/id-token',
      data: jsonEncode({'idToken': idToken}),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw ApiException(
          statusCode: response.statusCode, message: 'Failed to login user');
    }
  }

  Future<void> forgotPassword(ForgotPasswordDto forgotPasswordDto) async {
    final response = await dio.post(
      '/auth/forgot-password',
      data: forgotPasswordDto.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send password reset email');
    }
  }

  Future<void> resetPassword(ResetPasswordDto resetPasswordDto) async {
    final response = await dio.post(
      '/auth/reset-password',
      data: resetPasswordDto.toJson(),
    );

    if (response.statusCode != 200) {
      throw ApiException(
          statusCode: response.statusCode, message: 'Failed to reset password');
    }
  }

  Future<void> verifyEmail(VerifyEmailDto verifyEmailDto) async {
    final response = await dio.post(
      '/auth/verify-email',
      data: verifyEmailDto.toJson(),
    );

    if (response.statusCode != 200) {
      throw ApiException(
          message: 'Failed to verify email', statusCode: response.statusCode);
    }
  }

  Future<String> refreshToken(RefreshTokenDto refreshTokenDto) async {
    final response = await dio.post(
      '/auth/refresh-token',
      data: refreshTokenDto.toJson(),
    );

    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      throw ApiException(
          message: 'Failed to refresh token', statusCode: response.statusCode);
    }
  }
}
