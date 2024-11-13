import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/home/domain/interface/i_home_repository.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/product/helper/service_path.dart';

class HomeRepository extends IHomeRepository {
  HomeRepository({required this.dio, required this.logger});

  final Dio dio;
  final Logger logger;

  @override
  Future<AsyncValue<List<UserModel>>> getUsers() async {
    final response = await dio.get<dynamic>(ServicePath.users.path);
    if (response.statusCode == 200) {
      final users = (response.data! as List)
          .map((user) => UserModel.fromJson(user as Map<String, dynamic>))
          .toList();
      return AsyncValue.data(users);
    } else {
      logger.d('message: ${response.statusMessage}');
      return AsyncValue.error('error', StackTrace.current);
    }
  }
}
