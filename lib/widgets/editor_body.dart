import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/controllers/home_controller.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/widgets/form_item.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditorBody extends StatefulWidget {
  const EditorBody({super.key});

  @override
  State<EditorBody> createState() => _EditorBodyState();
}

class _EditorBodyState extends State<EditorBody> {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ReactiveForm(
          formGroup: _controller.formGroup,
          child: Column(
            children: [
              FormItem(
                readOnly: _controller.readOnly.value,
                fontWeight: FontWeight.w400,
                hintFontSize: 48,
                fontSize: 35,
                formControlName: _controller.titleControl,
                hintText: 'Title',
                textColor: AppColors.white,
                minLines: 1,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                validationMessage: null,
              ),
              SizedBox(height: 30),
              Expanded(
                child: FormItem(
                  readOnly: _controller.readOnly.value,
                  // minLines: 1,
                  fontSize: 23,
                  textAlignVertical: TextAlignVertical.top,
                  expand: true,
                  fontWeight: FontWeight.w400,
                  hintFontSize: 23,
                  formControlName: _controller.descriptionControl,
                  hintText: 'Type something...',
                  textColor: AppColors.white,
                  keyboardType: TextInputType.multiline,
                  validationMessage: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
