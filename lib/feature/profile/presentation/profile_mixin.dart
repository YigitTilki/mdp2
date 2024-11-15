part of 'profile_view.dart';

mixin _ProfileMixin on ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profileProvider.notifier)
          .getAlbums(widget.userModel.id.toString());

      ref
          .read(profileProvider.notifier)
          .getPosts(widget.userModel.id.toString());
    });
  }
}
