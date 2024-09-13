
import 'package:dio/dio.dart';
import '../models/models.dart';
import '../utils/app_constants.dart';
import 'api_config.dart';

class NotificationsApi {
  Dio get _dio => ApiConfig.dio;
  Future<Notification> createNotification(Map<String, dynamic> data) async {
    final response = await _dio.post(
      '${AppConstants.baseUrl}/notifications',
      data: data,
    );

    if (response.statusCode == 201) {
      return Notification.fromJson(response.data);
    } else {
      throw Exception('Failed to create notification');
    }
  }

  Future<List<Notification>> getNotifications() async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications',
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((notification) => Notification.fromJson(notification))
          .toList();
    } else {
      throw Exception('Failed to fetch notifications');
    }
  }

  Future<Notification> getNotificationById(int notificationId) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications/$notificationId',
    );

    if (response.statusCode == 200) {
      return Notification.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch notification');
    }
  }

  Future<Notification> updateNotification(
      int notificationId, Map<String, dynamic> data) async {
    final response = await _dio.patch(
      '${AppConstants.baseUrl}/notifications/$notificationId',
      data: data,
    );

    if (response.statusCode == 200) {
      return Notification.fromJson(response.data);
    } else {
      throw Exception('Failed to update notification');
    }
  }

  Future<void> deleteNotification(int notificationId) async {
    final response = await _dio.delete(
      '${AppConstants.baseUrl}/notifications/$notificationId',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete notification');
    }
  }

  Future<List<Notification>> searchNotifications(String query) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications/search?query=$query',
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((notification) => Notification.fromJson(notification))
          .toList();
    } else {
      throw Exception('Failed to search notifications');
    }
  }

  Future<List<Notification>> getNotificationsByUser(int userId) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications/user/$userId',
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((notification) => Notification.fromJson(notification))
          .toList();
    } else {
      throw Exception('Failed to fetch notifications for user');
    }
  }

  Future<List<Notification>> getUnreadNotifications(int userId) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications/unread',
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((notification) => Notification.fromJson(notification))
          .toList();
    } else {
      throw Exception('Failed to fetch unread notifications for user');
    }
  }

  Future<void> markNotificationAsRead(int notificationId) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/notifications/read/$notificationId',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification as read');
    }
  }
}
