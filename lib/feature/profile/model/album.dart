import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdp2/feature/profile/model/photo.dart';

part 'album.g.dart';
part 'album.freezed.dart';

@freezed
class Album with _$Album {
  const factory Album({
    int? userId,
    int? id,
    String? title,
    List<Photo>? photos,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
