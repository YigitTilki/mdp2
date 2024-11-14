import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/domain/interface/i_profile_repository.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/domain/profile_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

class ProfileNotifier extends BaseNotifier<ProfileState> {
  ProfileNotifier({required IProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState());

  final Map<int, String> _imageUrls = {};
  final Set<int> failedImages = {};

  late final IProfileRepository _profileRepository;

  Future<void> getPosts(String userId) async {
    final data = await _profileRepository.getUserPosts(userId);
    emit(state.copyWith(posts: data));
  }

  Future<void> getAlbums(String userId) async {
    final data = await _profileRepository.getUserAlbumsWithPhotos(userId);
    emit(state.copyWith(albums: data));
    await _initializeImageUrls(
      data,
    );
  }

  Future<void> _initializeImageUrls(AsyncValue<List<AlbumModel>> albums) async {
    try {
      _imageUrls.clear();
      for (var i = 0; i < albums.value!.length; i++) {
        _imageUrls[i] = albums.value![i].photos?.first.url ?? '';
      }
      emit(
        state.copyWith(
          imageUrls: AsyncValue.data(Map.from(_imageUrls)),
        ),
      );
    } catch (e) {
      emit(state.copyWith(imageUrls: AsyncValue.error(e, StackTrace.current)));
    }
  }

  void reloadImage(int index) {
    if (_imageUrls.containsKey(index)) {
      _imageUrls[index] =
          '${_imageUrls[index]}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
      failedImages.remove(index);
      emit(
        state.copyWith(
          imageUrls: AsyncValue.data(Map.from(_imageUrls)),
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
        imageUrls: AsyncValue.data(Map.from(_imageUrls)),
      ),
    );
  }

  void clearData() {
    emit(const ProfileState());
  }
}
