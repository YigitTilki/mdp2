import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    List<AlbumModel>? albums,
    List<PostModel>? posts,
    Map<int, String>? imageUrls,
    Set<int>? failedImages,
  }) = _ProfileModel;
}
