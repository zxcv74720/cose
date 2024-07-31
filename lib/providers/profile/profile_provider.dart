import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../dto/user_response_dto.dart';
import '../../services/profile_service.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, UserResponseDto?>((ref) => ProfileNotifier());

class ProfileNotifier extends StateNotifier<UserResponseDto?> {
  final profileService = ProfileService();

  ProfileNotifier() : super(null);

  Future<void> loadProfile() async {
    state = await profileService.getProfile();
  }

  Future<void> updateProfileImagePath() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      state = state!.copyWith(profileImagePath: image.path);
      profileService.updateProfileImagePath(image.path);
    }
  }

  Future<void> updateName(String name) async {
    state = state!.copyWith(name: name);
    profileService.updateName(name);
  }
}