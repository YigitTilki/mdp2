import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/data/profile_repository.dart';
import 'package:mdp2/feature/profile/domain/profile_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

final profileProvider =
    StateNotifierProvider<ProfileProvider, ProfileState>((ref) {
  return ProfileProvider();
});

class ProfileProvider extends BaseNotifier<ProfileState> {
  ProfileProvider() : super(const ProfileState());

  Future<void> getAlbums(String userId) async {
    startLoading();

    try {
      final data = await ProfileRepository().getUserAlbumsWithPhotos(userId);
      if (data.isEmpty) {
        setError('No albums found');
      } else {
        emit(state.copyWith(albums: data));
      }
    } catch (e) {
      setError('Error fetching albums: $e');
    } finally {
      stopLoading();
    }
  }

  Future<void> refreshAlbum(String albumId) async {
    startLoading();
    try {
      final data = await ProfileRepository().getAlbumPhotos(albumId);

      if (data.isEmpty) {
        setError('No photos found for this album');
      } else {
        final updatedAlbums = state.albums?.map((album) {
          if (album.id.toString() == albumId) {
            return album.copyWith(photos: data);
          }
          return album;
        }).toList();

        emit(state.copyWith(albums: updatedAlbums));
      }
    } catch (e) {
      setError('Error fetching photos: $e');
    } finally {
      stopLoading();
    }
  }

  void stopLoading() {
    emit(state.copyWith(isLoading: false));
  }

  void startLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void setError(String message) {
    emit(state.copyWith(error: true));
    // Optionally, store the error message to provide more context
    // emit(state.copyWith(errorMessage: message));
  }
}
