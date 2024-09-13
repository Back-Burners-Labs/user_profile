import 'package:dio/dio.dart';
import '../utils/app_exceptions.dart';
import 'api_config.dart';

abstract class BaseApi<T> {
  Dio get dio => ApiConfig.dio;
  final String _endpoint;
  T Function(Map<String, dynamic> json) fromJson;

  BaseApi(this._endpoint, this.fromJson);

  Future<T> create(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        '/$_endpoint',
        data: data,
      );
      if (response.statusCode == 201) {
        return fromJson(response.data);
      } else {
        throw ApiException(
            message: 'Failed to create item', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> getAll({int page = 1, int pageSize = 10}) async {
    try {
      final response =
          await dio.get('/$_endpoint?page$page&pageSize=$pageSize');
      if (response.statusCode == 200) {
        return (response.data is Map
                ? response.data["items"] as List
                : response.data as List)
            .map((item) => fromJson(item))
            .toList();
      } else {
        throw ApiException(
            message: 'Failed to fetch items', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<T> getById(int id) async {
    try {
      final response = await dio.get('/$_endpoint/$id');
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw ApiException(
            message: 'Failed to fetch item', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<T> update(int id, Map<String, dynamic> data) async {
    try {
      final response = await dio.patch(
        '/$_endpoint/$id',
        data: data,
      );
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw ApiException(
            message: 'Failed to update item', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      final response = await dio.delete('/$_endpoint/$id');
      if (response.statusCode != 200) {
        throw ApiException(
            message: 'Failed to delete item', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> search(String query) async {
    try {
      final response = await dio.get(
        '/$_endpoint/search?query=$query',
      );
      if (response.statusCode == 200) {
        return (response.data as List).map((item) => fromJson(item)).toList();
      } else {
        throw ApiException(
            message: 'Failed to search items', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
