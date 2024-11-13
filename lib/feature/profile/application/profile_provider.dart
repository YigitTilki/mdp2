import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/data/profile_repository.dart';
import 'package:mdp2/feature/profile/domain/album_model.dart';
import 'package:mdp2/feature/profile/domain/profile_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

final profileProvider =
    StateNotifierProvider<ProfileProvider, ProfileState>((ref) {
  return ProfileProvider();
});

class ProfileProvider extends BaseNotifier<ProfileState> {
  ProfileProvider() : super(const ProfileState());

  final Map<int, String> _imageUrls = {};
  final Set<int> failedImages = {};

  Future<void> getPosts(String userId) async {
    try {
      final data = await ProfileRepository().getUserPosts(userId);
      if (data.isEmpty) {
        setError('No posts found');
      } else {
        emit(state.copyWith(posts: data));
      }
    } catch (e) {
      setError('Error fetching posts: $e');
    } finally {}
  }

  Future<void> getAlbums(String userId) async {
    startLoading();

    try {
      final data = await ProfileRepository().getUserAlbumsWithPhotos(userId);
      if (data.isEmpty) {
        setError('No albums found');
      } else {
        emit(state.copyWith(albums: data));
        _initializeImageUrls(
          data,
        );
      }
    } catch (e) {
      setError('Error fetching albums: $e');
    } finally {
      stopLoading();
    }
  }

  void _initializeImageUrls(List<AlbumModel> albums) {
    _imageUrls.clear();
    for (var i = 0; i < albums.length; i++) {
      _imageUrls[i] = albums[i].photos?.first.url ?? '';
    }
    emit(
      state.copyWith(
        imageUrls: Map.from(_imageUrls),
      ),
    );
  }

  void reloadImage(int index) {
    if (_imageUrls.containsKey(index)) {
      _imageUrls[index] =
          '${_imageUrls[index]}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
      failedImages.remove(index);
      emit(
        state.copyWith(
          imageUrls: Map.from(_imageUrls),
        ),
      );
    }
  }

  Future<void> reloadFailedImages() async {
    for (final index in failedImages) {
      if (_imageUrls.containsKey(index)) {
        _imageUrls[index] =
            '${_imageUrls[index]}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
      }
    }
    failedImages.clear();
    emit(
      state.copyWith(
        imageUrls: Map.from(_imageUrls),
      ),
    );
  }

  void stopLoading() {
    emit(state.copyWith(isLoading: false));
  }

  void startLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void setError(String message) {
    emit(state.copyWith(error: true));
  }
}
