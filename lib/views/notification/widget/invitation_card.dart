import 'package:cose_front/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class InvitationCard extends StatelessWidget {
  final String inviter;
  final String course;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const InvitationCard({
    super.key,
    required this.inviter,
    required this.course,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(width * 0.03, height * 0.005, 0, height * 0.005),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$inviter ',
              style: black14BoldTextStyle,
            ),
            const TextSpan(
              text: '님으로부터 ',
              style: black14TextStyle,
            ),
            TextSpan(
              text: '$course ',
              style: black14BoldTextStyle,
            ),
            const TextSpan(
              text: '코스 초대를 받으셨습니다.',
              style: black14TextStyle,
            ),
          ],
        ),
      ),
      leading: CircleAvatar(
        radius: 22,
        child: Text(inviter.isNotEmpty ? inviter[0] : ''),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Text('수락', style: white14BoldTextStyle),
          ),
          IconButton(
            onPressed: onReject,
            icon: Icon(Icons.close, size: 16, color: grey),
          ),
        ],
      ),
    );
  }
}
