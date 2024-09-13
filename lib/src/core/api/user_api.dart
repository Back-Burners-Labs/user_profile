import '../models/models.dart';
import '../utils/app_exceptions.dart';
import 'api.dart';

class UserApi extends BaseApi<User> {
  UserApi() : super('users', User.fromJson);

  Future<User> createCoach(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        '/users/coach',
        data: data,
      );
      if (response.statusCode == 201) {
        return User.fromJson(response.data);
      } else {
        throw ApiException(
            message: 'Failed to create coach', statusCode: response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
