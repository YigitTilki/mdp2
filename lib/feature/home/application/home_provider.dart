import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/data/home_repository.dart';
import 'package:mdp2/feature/home/domain/home_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeProvider extends BaseNotifier<HomeState> {
  HomeProvider() : super(const HomeState());

  Future<void> getUsers() async {
    startLoading();
    final data = await HomeRepository().getUsers();
    if (data.isEmpty) {
      setError();
    } else {
      emit(state.copyWith(users: data));
    }
    stopLoading();
  }

  void stopLoading() {
    emit(state.copyWith(isLoading: false));
  }

  void startLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void setError() {
    emit(state.copyWith(error: true));
  }
}
