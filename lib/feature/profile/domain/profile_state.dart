// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.albums = const AsyncValue.loading(),
    this.posts = const AsyncValue.loading(),
    this.imageUrls = const AsyncValue.loading(),
    this.failedImages = const {},
  });

  final AsyncValue<List<AlbumModel>> albums;
  final AsyncValue<List<PostModel>> posts;
  final AsyncValue<Map<int, String>> imageUrls;
  final Set<int> failedImages;

  @override
  List<Object?> get props {
    return [
      albums,
      posts,
      imageUrls,
      failedImages,
    ];
  }

  ProfileState copyWith({
    AsyncValue<List<AlbumModel>>? albums,
    AsyncValue<List<PostModel>>? posts,
    AsyncValue<Map<int, String>>? imageUrls,
    Set<int>? failedImages,
  }) {
    return ProfileState(
      albums: albums ?? this.albums,
      posts: posts ?? this.posts,
      imageUrls: imageUrls ?? this.imageUrls,
      failedImages: failedImages ?? this.failedImages,
    );
  }
}
