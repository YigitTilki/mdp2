part of 'home_view.dart';

mixin _HomeMixin on ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  void changeLanguage() {
    final currentLanguage = ref.watch(languageProvider);
    final newLocale = currentLanguage.languageCode == 'en'
        ? const Locale('tr')
        : const Locale('en');

    ref.read(languageProvider.notifier).state = newLocale;

    FlutterI18n.refresh(context, newLocale);
  }
}
