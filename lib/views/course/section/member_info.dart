import 'dart:io';

import 'package:cose_front/dto/course_response_dto.dart';
import 'package:cose_front/dto/course_user_dto.dart';
import 'package:cose_front/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../enums/EditPermission.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/validations.dart';
import '../../../widgets/custom_buttom.dart';

class MemberInfo extends ConsumerStatefulWidget {
  final CourseResponseDto course;

  const MemberInfo({super.key, required this.course});

  @override
  _MemberInfoWidgetState createState() => _MemberInfoWidgetState();
}

class _MemberInfoWidgetState extends ConsumerState<MemberInfo> {
  bool isInviting = false;
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  EditPermission? _editPermission;

  bool get _isButtonDisabled => _emailController.text.isEmpty;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onInputChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onInputChanged);
    _emailFocus.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onInputChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      child: (isInviting)
          ? _buildBottomSheet(context, height, width)
          : _buildMainContent(context, height, width, widget.course.members),
    );
  }

  Widget _buildMainContent(BuildContext context, double height, double width, List<CourseUserDTO> courseUsers) {
    return ListView(
      key: ValueKey<bool>(isInviting),
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.03,
              right: width * 0.03,
              bottom: height * 0.01),
          child: const Center(
            child: Text(
              '그룹 관리',
              style: black18TextStyle,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isInviting = !isInviting;
            });
          },
          child: const Padding(
            padding:
            EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_add_alt),
                    SizedBox(width: 16.0),
                    Text(
                      '멤버 초대',
                      style: black14TextStyle,
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: grey,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: dividerGrey,
        ),
        ...courseUsers.asMap().entries.map((entry) {
          final value = entry.value;
          _editPermission = value.editPermission;

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(width * 0.03, height * 0.005, width * 0.03, height * 0.005),
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: value.profileImagePath != null && value.profileImagePath!.isNotEmpty
                  ? FileImage(File(value.profileImagePath!))
                  : null,
              child: value.profileImagePath == null || value.profileImagePath!.isEmpty
                  ? Text(value.name.isNotEmpty ? value.name[0] : '')
                  : null,
            ),
            title: Text(
              value.name,
              style: black16TextStyle,
            ),
            trailing: DropdownButton<EditPermission>(
              icon: const Icon(Icons.keyboard_arrow_down, color: grey),
              underline: Container(),
              focusColor: black,
              value: _editPermission,
              onChanged: (EditPermission? newValue) {
                if (newValue != null) {
                  setState(() {
                    _editPermission = newValue;
                  });
                }
              },
              items: EditPermission.values.map<DropdownMenuItem<EditPermission>>((EditPermission value) {
                return DropdownMenuItem<EditPermission>(
                  value: value,
                  child: Text(
                    value.toDisplayString(),
                    style: black14TextStyle,
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context, double height, double width) {
    return ListView(
      key: ValueKey<bool>(isInviting),
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
          child: ListTile(
            leading: InkWell(
              onTap: () {
                setState(() {
                  isInviting = !isInviting;
                });
              },
              child: const Padding(
                padding: EdgeInsets.zero,
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            title: Text(
              '멤버 초대',
              style: black18TextStyle,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: CustomInputField(
            label: '이메일',
            hintText: '초대할 이메일을 입력해 주세요',
            controller: _emailController,
            focusNode: _emailFocus,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            icon: Icons.mail_outline,
            validator: (value) => validateEmail(_emailFocus, value),
          ),
        ),
        ListTile(
          title: const Text(
            '접근 권한 설정',
            style: black14TextStyle,
          ),
          trailing: DropdownButton<EditPermission>(
            icon: Icon(Icons.keyboard_arrow_down, color: grey),
            underline: Container(),
            focusColor: Theme.of(context).colorScheme.scrim,
            value: _editPermission,
            onChanged: (EditPermission? newValue) {
              if (newValue != null) {
                setState(() {
                  _editPermission = newValue;
                });
              }
            },
            items: EditPermission.values.map<DropdownMenuItem<EditPermission>>((EditPermission value) {
              return DropdownMenuItem<EditPermission>(
                value: value,
                child: Text(
                  value.toDisplayString(),
                  style: black14TextStyle,
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: CustomButton(
            text: '초대',
            onPressed: () {},
            isDisabled: _isButtonDisabled,
          ),
        ),
      ],
    );
  }
}