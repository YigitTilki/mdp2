import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/home/presentation/home_view.dart';
import 'package:mdp2/feature/posts/presentation/posts_view.dart';
import 'package:mdp2/feature/profile/presentation/profile_view.dart';
import 'package:mdp2/feature/splash/presentation/splash_view.dart';

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
