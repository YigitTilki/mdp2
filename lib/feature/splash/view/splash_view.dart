import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdp2/feature/splash/view/widgets/no_net_dialog.dart';
import 'package:mdp2/feature/splash/view_model/splash_view_model.dart';
import 'package:mdp2/main.dart';
import 'package:mdp2/product/helper/app_spacer.dart';
import 'package:mdp2/product/navigation/app_router.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(splashViewModelProvider);

    return Scaffold(
      body: Center(
        child: viewModel.maybeWhen(
          loading: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/app_icon.svg'),
              const AppSpacer.vertical20(),
              const CircularProgressIndicator(),
            ],
          ),
          data: (data) {
            if (data == true) {
              appRouter.replace(const HomeRoute());
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                NoNetDialog.show(context);
              });
            }
            return null;
          },
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
          orElse: SizedBox.new,
        ),
      ),
    );
  }
}
