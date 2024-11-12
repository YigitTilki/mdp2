import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  const PhotoModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );
  }
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

  PhotoModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return PhotoModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
