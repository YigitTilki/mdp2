// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [PostsView]
class PostsRoute extends PageRouteInfo<PostsRouteArgs> {
  PostsRoute({
    required User userModel,
    required int initialIndex,
    required ProfileState profileModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PostsRoute.name,
          args: PostsRouteArgs(
            userModel: userModel,
            initialIndex: initialIndex,
            profileModel: profileModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostsRouteArgs>();
      return PostsView(
        userModel: args.userModel,
        initialIndex: args.initialIndex,
        profileModel: args.profileModel,
        key: args.key,
      );
    },
  );
}

class PostsRouteArgs {
  const PostsRouteArgs({
    required this.userModel,
    required this.initialIndex,
    required this.profileModel,
    this.key,
  });

  final User userModel;

  final int initialIndex;

  final ProfileState profileModel;

  final Key? key;

  @override
  String toString() {
    return 'PostsRouteArgs{userModel: $userModel, initialIndex: $initialIndex, profileModel: $profileModel, key: $key}';
  }
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    required User userModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return ProfileView(
        userModel: args.userModel,
        key: args.key,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    required this.userModel,
    this.key,
  });

  final User userModel;

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}
