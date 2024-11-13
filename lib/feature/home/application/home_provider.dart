import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/data/home_repository.dart';
import 'package:mdp2/feature/home/domain/home_state.dart';
import 'package:mdp2/feature/home/domain/interface/i_home_repository.dart';
import 'package:mdp2/product/base/base_notifier.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final dio = ref.watch(dioProvider);
  final logger = ref.watch(loggerProvider);
  return HomeNotifier(homeRepository: HomeRepository(dio: dio, logger: logger));
});

class HomeNotifier extends BaseNotifier<HomeState> {
  HomeNotifier({
    required IHomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const HomeState());

  late final IHomeRepository _homeRepository;

  Future<void> getUsers() async {
    final data = await _homeRepository.getUsers();
    emit(state.copyWith(users: data));
  }
}
