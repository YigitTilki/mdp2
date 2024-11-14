import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/splash/domain/splash_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

final splashProvider =
    StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});

class SplashProvider extends BaseNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    await _delay();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(state.copyWith(isConnected: false));
      return;
    } else {
      emit(state.copyWith(isConnected: true));
      return;
    }
  }

  Future<void> _delay() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
