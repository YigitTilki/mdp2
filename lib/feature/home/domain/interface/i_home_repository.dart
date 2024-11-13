import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';

abstract class IHomeRepository {
  Future<AsyncValue<List<UserModel>>> getUsers();
}
