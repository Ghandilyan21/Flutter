import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/controllers/home_controller.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/views/home_screen.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/utils/assets.dart';
import 'package:note_app/utils/enum.dart';
import 'package:note_app/widgets/app_bar.dart';
import 'package:note_app/widgets/custome_icon_btn.dart';
import 'package:note_app/widgets/editor_body.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key, required this.type});
  final EditorScreenType type;
  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final HomeController _controller = Get.find<HomeController>();
  Note? note;

  @override
  void initState() {
    if (widget.type == EditorScreenType.editNote && Get.arguments is Note) {
      note = Get.arguments as Note;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.readOnly.value = true;
      });
      _controller.formGroup.control(_controller.titleControl).value =
          note?.title;
      _controller.formGroup.control(_controller.descriptionControl).value =
          note?.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        child: Scaffold(
          appBar: (!_controller.readOnly.value)
              ? MyAppBar(
                  title: CustomeIconBtn(
                    bgColor: AppColors.primary,
                    icon: Image.asset(AppAssets.chevronLeft),
                    onTap: () {
                      Get.to(
                        transition: Transition.noTransition,
                        HomeScreen(),
                      );
                    },
                  ),
                  ations: [
                    SizedBox(
                      width: 20,
                    ),
                    CustomeIconBtn(
                      bgColor: AppColors.primary,
                      icon: Image.asset(AppAssets.visibility),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomeIconBtn(
                        bgColor: AppColors.primary,
                        icon: Image.asset(AppAssets.save),
                        onTap: () {
                          _controller.onTapSave(context, note);
                        }),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : MyAppBar(
                  title: CustomeIconBtn(
                    bgColor: AppColors.primary,
                    icon: Image.asset(AppAssets.chevronLeft),
                    onTap: () {
                      Get.to(
                        HomeScreen(),
                        transition: Transition.noTransition,
                      );
                    },
                  ),
                  ations: [
                    SizedBox(
                      width: 20,
                    ),
                    CustomeIconBtn(
                      bgColor: AppColors.primary,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        _controller.readOnly.value = false;
                        _controller.type = EditorScreenType.editNote;
                        await _controller.showSuccesSnackBar(
                            succesMsg: 'Edit mode');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Column(
              children: [
                EditorBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
