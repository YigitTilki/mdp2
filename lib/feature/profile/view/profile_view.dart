import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/model/user.dart';
import 'package:mdp2/feature/profile/view/widgets/albums_view.dart';
import 'package:mdp2/feature/profile/view/widgets/edit_share_row.dart';
import 'package:mdp2/feature/profile/view/widgets/follower_detail_row.dart';
import 'package:mdp2/feature/profile/view/widgets/user_info_column.dart';
import 'package:mdp2/feature/profile/view_model/profile_view_model.dart';
import 'package:mdp2/product/helper/app_padding.dart';
import 'package:mdp2/product/helper/app_spacer.dart';
import 'package:mdp2/product/helper/extensions/translate_extension.dart';

part 'profile_mixin.dart';

@RoutePage()
class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({
    required this.userModel,
    super.key,
  });

  final User userModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> with _ProfileMixin {
  @override
  Widget build(BuildContext context) {
    final user = widget.userModel;
    final state = ref.watch(profileViewModelProvider(user.id.toString()));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(user.username),
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
                  state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) => AlbumsView(
                      userModel: widget.userModel,
                      profileModel: data,
                    ),
                    orElse: SizedBox.new,
                  ),
                  Center(
                    child:
                        Text(ref.translate('profile_page.no_mentioned_posts')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
