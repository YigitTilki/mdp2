import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mdp2/feature/home/model/user.dart';
import 'package:mdp2/feature/home/view/home_view.dart';
import 'package:mdp2/feature/posts/presentation/posts_view.dart';
import 'package:mdp2/feature/profile/model/profile_state.dart';
import 'package:mdp2/feature/profile/view/profile_view.dart';
import 'package:mdp2/feature/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: PostsRoute.page),
      ];
}
