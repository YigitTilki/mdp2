import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';
import 'package:mdp2/feature/profile/presentation/widgets/albums_view.dart';
import 'package:mdp2/feature/profile/presentation/widgets/edit_share_row.dart';
import 'package:mdp2/feature/profile/presentation/widgets/follower_detail_row.dart';
import 'package:mdp2/feature/profile/presentation/widgets/user_info_column.dart';
import 'package:mdp2/product/helper/app_padding.dart';
import 'package:mdp2/product/helper/app_spacer.dart';

part 'profile_mixin.dart';

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

class _ProfileViewState extends ConsumerState<ProfileView> with _ProfileMixin {
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
                  const FollowerDetailRow(),
                  const AppSpacer.vertical5(),
                  UserInfoColumn(user: user),
                  const AppSpacer.vertical10(),
                  const EditShareRow(),
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
            Expanded(
              child: TabBarView(
                children: [
                  state.posts.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) => state.albums.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      data: (data) => AlbumsView(userModel: widget.userModel),
                      orElse: SizedBox.new,
                    ),
                    orElse: SizedBox.new,
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
