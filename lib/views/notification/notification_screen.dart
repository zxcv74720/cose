import 'package:cose_front/utils/app_colors.dart';
import 'package:cose_front/views/notification/widget/invitation_card.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_flexible_space.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  void _handleAccept() {
    // TODO 수락 버튼 클릭 시 실행될 코드

  }

  void _handleReject() {
    // TODO 거절 버튼 클릭 시 실행될 코드

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: white,
              expandedHeight: height * 0.08,
              floating: true,
              pinned: true,
              flexibleSpace: const CustomFlexibleSpace(title: '알림'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  1,
                  (index) => InvitationCard(
                    inviter: '길동무',
                    course: '성수에서 하루 놀기',
                    onAccept: _handleAccept,
                    onReject: _handleReject,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

