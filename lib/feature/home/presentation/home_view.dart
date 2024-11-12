import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/application/home_provider.dart';
import 'package:mdp2/product/navigation/app_router.dart';

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
    final state = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterI18n.translate(context, 'hello')"),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ListView.builder(
                itemCount: state.users?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      context.router
                          .push(ProfileRoute(userModel: state.users![index]));
                    },
                    leading: const CircleAvatar(),
                    title: Text(state.users?[index].username ?? ''),
                    subtitle: Text(state.users?[index].name ?? ''),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
