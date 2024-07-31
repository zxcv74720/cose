import 'package:cose_front/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/course/course_creation_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/custom_input_field.dart';

class CourseForm extends StatefulWidget {
  const CourseForm({super.key});

  @override
  _CourseFormState createState() =>
      _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();

  bool get _isButtonDisabled => _titleController.text.isEmpty;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_onInputChanged);
  }

  @override
  void dispose() {
    _titleController.removeListener(_onInputChanged);
    _titleFocus.dispose();
    super.dispose();
  }

  void _onInputChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            width * 0.06, height * 0.02, width * 0.06, height * 0.05),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '코스 정보',
              style: black16BoldTextStyle,
            ),
            SizedBox(height: height * 0.02),
            CustomInputField(
              label: '코스',
              controller: _titleController,
              focusNode: _titleFocus,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              hintText: '코스 이름을 입력해 주세요',
              icon: Icons.place,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력해 주세요';
                }
                return null;
              },
            ),
            SizedBox(height: height * 0.05),
            Consumer(builder: (context, ref, child) {
              return CustomButton(
                  text: '생성',
                  isDisabled: _isButtonDisabled,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await ref.read(courseCreationProvider.notifier).createCourse(_titleController.text);
                      customToast(context, "코스를 생성하였습니다.");
                      context.go('/home');
                    }
                  });
            }),
          ],
        ),
      ),
    );
  }
}
