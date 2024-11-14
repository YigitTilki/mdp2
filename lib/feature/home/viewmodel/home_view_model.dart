import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/home/model/user_model.dart';
import 'package:mdp2/product/helper/service_path.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  Dio get dio => ref.read(dioProvider);
  Logger get logger => ref.read(loggerProvider);

  @override
  Future<List<UserModel>> build() async {
    return getUsers();
  }

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get<dynamic>(ServicePath.users.path);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((user) => UserModel.fromJson(user as Map<String, dynamic>))
            .toList();
      } else {
        logger.e('Error: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw Exception('Failed to load users');
    }
  }
}
