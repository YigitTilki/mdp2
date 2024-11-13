import 'package:auto_route/auto_route.dart';
import 'package:mdp2/feature/home/presentation/home_view.dart';
import 'package:mdp2/feature/splash/presentation/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
