import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/view_model/home_view_model.dart';
import 'package:mdp2/main.dart';
import 'package:mdp2/product/helper/extensions/translate_extension.dart';
import 'package:mdp2/product/navigation/app_router.dart';
import 'package:mdp2/product/providers/language_provider.dart';

part 'home_mixin.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with _HomeMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(ref.translate('home_page.welcome')),
        actions: [
          IconButton(
            onPressed: changeLanguage,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: state.maybeWhen(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) => SafeArea(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  appRouter.push(ProfileRoute(userModel: data[index]));
                },
                leading: const CircleAvatar(),
                title: Text(data[index].username),
                subtitle: Text(data[index].name),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              );
            },
          ),
        ),
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
