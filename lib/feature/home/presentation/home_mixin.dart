part of 'home_view.dart';

mixin _HomeMixin on ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getUsers();
    });
  }
}
