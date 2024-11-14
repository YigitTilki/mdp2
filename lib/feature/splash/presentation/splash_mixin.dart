import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/splash/application/splash_provider.dart';
import 'package:mdp2/feature/splash/presentation/splash_view.dart';
import 'package:mdp2/product/navigation/app_router.dart';

mixin SplashMixin on ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkInternetConnection();
  }

  Future<void> listenAndNavigate() async {
    ref.listen(splashProvider, (previous, next) {
      if (next.isConnected == false) {
        return;
      } else {
        context.router.replace(const HomeRoute());
      }
    });
  }
}
