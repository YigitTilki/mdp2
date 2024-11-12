import 'package:logger/logger.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/product/service/api_service.dart';

class HomeRepository {
  final _dio = ApiService().dio;
  final _logger = Logger();

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get<dynamic>('/users');
      final users = (response.data! as List)
          .map((user) => UserModel.fromJson(user as Map<String, dynamic>))
          .toList();
      return users;
    } catch (e) {
      _logger.d('error get users: $e');
      return [];
    }
  }
}
