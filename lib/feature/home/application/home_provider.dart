import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/application/home_notifier.dart';
import 'package:mdp2/feature/home/data/home_repository.dart';
import 'package:mdp2/feature/home/domain/home_state.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final dio = ref.watch(dioProvider);
  final logger = ref.watch(loggerProvider);
  return HomeNotifier(homeRepository: HomeRepository(dio: dio, logger: logger));
});
