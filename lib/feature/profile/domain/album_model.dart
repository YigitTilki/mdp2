// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp2/feature/profile/domain/photo_model.dart';

class AlbumModel with EquatableMixin {
  AlbumModel({
    this.userId,
    this.id,
    this.title,
    this.photos,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }
  final int? userId;
  final int? id;
  final String? title;
  List<PhotoModel>? photos;

  @override
  List<Object?> get props => [userId, id, title, photos];

  AlbumModel copyWith({
    int? userId,
    int? id,
    String? title,
    List<PhotoModel>? photos,
  }) {
    return AlbumModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}
