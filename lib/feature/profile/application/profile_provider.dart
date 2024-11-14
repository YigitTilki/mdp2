import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/application/profile_notifier.dart';
import 'package:mdp2/feature/profile/data/profile_repository.dart';
import 'package:mdp2/feature/profile/domain/profile_state.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final dio = ref.watch(dioProvider);
  final logger = ref.watch(loggerProvider);

  return ProfileNotifier(
    profileRepository: ProfileRepository(dio: dio, logger: logger),
  );
});
