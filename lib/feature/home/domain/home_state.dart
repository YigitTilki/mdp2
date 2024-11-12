// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp2/feature/home/domain/user_model/user_model.dart';

class HomeState extends Equatable {
  const HomeState({this.isLoading = false, this.users, this.error = false});

  final bool isLoading;
  final List<UserModel>? users;
  final bool error;

  @override
  List<Object?> get props {
    return [isLoading, users, error];
  }

  HomeState copyWith({
    bool? isLoading,
    List<UserModel>? users,
    bool? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
