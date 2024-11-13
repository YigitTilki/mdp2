import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';
import 'package:mdp2/feature/profile/presentation/widgets/albums_view.dart';
import 'package:mdp2/feature/profile/presentation/widgets/follower_detail_column.dart';
import 'package:mdp2/feature/profile/presentation/widgets/profile_avatar.dart';
import 'package:mdp2/product/helper/app_padding.dart';
import 'package:mdp2/product/helper/app_spacer.dart';

@RoutePage()
class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({
    required this.userModel,
    super.key,
  });

  final UserModel userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
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

  @override
  Widget build(BuildContext context) {
    final user = widget.userModel;
    final state = ref.watch(profileProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(user.username ?? ''),
          actions: const [],
        ),
        body: Column(
          children: [
            Padding(
              padding: const AppPadding.allLarge(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(child: ProfileAvatar()),
                      Expanded(
                        child: FollowerDetailColumn(
                          count: '3',
                          label: FlutterI18n.translate(
                            context,
                            'profile_page.posts',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FollowerDetailColumn(
                          count: '416',
                          label: FlutterI18n.translate(
                            context,
                            'profile_page.followers',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FollowerDetailColumn(
                          count: '379',
                          label: FlutterI18n.translate(
                            context,
                            'profile_page.following',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const AppSpacer.vertical5(),
                  Text(
                    user.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const AppSpacer.vertical5(),
                  Row(
                    children: [
                      const Icon(Icons.business),
                      const AppSpacer.horizontal5(),
                      Text(user.company?.name ?? ''),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.home),
                      const AppSpacer.horizontal5(),
                      Text(user.address?.city ?? ''),
                    ],
                  ),
                  const AppSpacer.vertical10(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            FlutterI18n.translate(
                              context,
                              'profile_page.edit_profile',
                            ),
                          ),
                        ),
                      ),
                      const AppSpacer.horizontal10(),
                      Expanded(
                        flex: 4,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            FlutterI18n.translate(
                              context,
                              'profile_page.share_profile',
                            ),
                          ),
                        ),
                      ),
                      const AppSpacer.horizontal10(),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.person_add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.photo_library),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],
            ),
            if (state.isLoading)
              const LinearProgressIndicator()
            else
              Expanded(
                child: TabBarView(
                  children: [
                    AlbumsView(
                      userModel: widget.userModel,
                    ),
                    const Text('fsd'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
