import 'dart:io';
import 'package:cose_front/providers/account/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/profile/profile_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadProfile();
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final profile = ref.watch(profileProvider);

    if (profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '내 프로필',
            textAlign: TextAlign.center,
            style: black20BoldTextStyle,
          ),
          centerTitle: true,
          backgroundColor: white,
        ),
        body: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(
                  width * 0.03, height * 0.005, width * 0.01, height * 0.005),
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: profile.profileImagePath.isNotEmpty
                    ? FileImage(File(profile.profileImagePath))
                    : null,
                child: profile.profileImagePath.isEmpty
                    ? Text(profile.name.isNotEmpty ? profile.name[0] : '')
                    : null,
              ),
              title: Text(profile.name),
              subtitle: Text(profile.email),
              trailing: IconButton(
                icon: const Icon(Icons.create),
                onPressed: () {
                  context.push('/profile/edit');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: const Divider(),
            ),
            const ListTile(
              title: Text(
                '기타',
                style: black18BoldTextStyle,
              ),
            ),
            ListTile(
              title: const Text('로그아웃'),
              onTap: () async {
                ref.read(authProvider.notifier).logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}