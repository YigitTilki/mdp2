// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp2/feature/profile/domain/album_model.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.isLoading = false,
    this.albums,
    this.error = false,
  });

  final bool isLoading;
  final List<AlbumModel>? albums;
  final bool error;

  @override
  List<Object?> get props => [isLoading, albums, error];

  ProfileState copyWith({
    bool? isLoading,
    List<AlbumModel>? albums,
    bool? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      albums: albums ?? this.albums,
      error: error ?? this.error,
    );
  }
}
