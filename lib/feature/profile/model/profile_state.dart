import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdp2/feature/profile/model/album.dart';
import 'package:mdp2/feature/profile/model/post.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    List<Album>? albums,
    List<Post>? posts,
    Map<int, String>? imageUrls,
    Set<int>? failedImages,
  }) = _ProfileState;
}
