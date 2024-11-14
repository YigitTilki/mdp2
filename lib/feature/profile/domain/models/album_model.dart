import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mdp2/feature/profile/domain/models/photo_model.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel with EquatableMixin {
  AlbumModel({
    this.userId,
    this.id,
    this.title,
    this.photos,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
  final int? userId;
  final int? id;
  final String? title;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<PhotoModel>? photos;

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);

  @override
  List<Object?> get props => [userId, id, title];

  AlbumModel copyWith({
    int? userId,
    int? id,
    String? title,
  }) {
    return AlbumModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
