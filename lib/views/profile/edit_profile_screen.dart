import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/profile/profile_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/validations.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_input_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadProfile();
      final profile = ref.read(profileProvider);
      _nameController.text = profile!.name;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final profile = ref.watch(profileProvider);

    if (profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: '프로필 편집',
          onLeadingPressed: () {
            if (_formKey.currentState!.validate()) {
              ref.read(profileProvider.notifier).updateName(_nameController.text);
              Navigator.of(context).pop();
            }
          },
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profile.profileImagePath.isNotEmpty
                        ? FileImage(File(profile.profileImagePath))
                        : null,
                    child: profile.profileImagePath.isEmpty
                        ? Text(profile.name.isNotEmpty ? profile.name[0] : '')
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: primary,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 20, color: white),
                        onPressed: () {ref.read(profileProvider.notifier).updateProfileImagePath();},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: CustomInputField(
                  label: '별명',
                  controller: _nameController,
                  focusNode: _nameFocus,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: '2자 이상 15자 이내로 입력',
                  icon: Icons.person_outline,
                  validator: (value) => validateName(_nameFocus, value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}