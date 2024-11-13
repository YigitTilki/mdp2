import 'package:mdp2/feature/home/domain/home_state.dart';
import 'package:mdp2/feature/home/domain/interface/i_home_repository.dart';
import 'package:mdp2/product/base/base_notifier.dart';

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
