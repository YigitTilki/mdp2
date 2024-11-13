// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp2/feature/profile/domain/album_model.dart';
import 'package:mdp2/feature/profile/domain/post_model.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.isLoading = false,
    this.albums,
    this.posts,
    this.error = false,
    this.imageUrls = const {},
    this.failedImages = const {},
  });

  final bool isLoading;
  final List<AlbumModel>? albums;
  final List<PostModel>? posts;
  final Map<int, String> imageUrls;
  final Set<int> failedImages;
  final bool error;

  @override
  List<Object?> get props {
    return [
      isLoading,
      albums,
      posts,
      imageUrls,
      failedImages,
      error,
    ];
  }

  ProfileState copyWith({
    bool? isLoading,
    List<AlbumModel>? albums,
    List<PostModel>? posts,
    Map<int, String>? imageUrls,
    Set<int>? failedImages,
    bool? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      albums: albums ?? this.albums,
      posts: posts ?? this.posts,
      imageUrls: imageUrls ?? this.imageUrls,
      failedImages: failedImages ?? this.failedImages,
      error: error ?? this.error,
    );
  }
}
