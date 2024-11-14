// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mdp2/feature/home/domain/user_model/user_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.users = const AsyncValue.loading(),
  });

  final AsyncValue<List<UserModel>> users;

  @override
  List<Object?> get props {
    return [users];
  }

  HomeState copyWith({
    AsyncValue<List<UserModel>>? users,
  }) {
    return HomeState(
      users: users ?? this.users,
    );
  }
}
