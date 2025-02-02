import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/storage/app_storage.dart';
import 'package:note_app/features/views/editor_screen.dart';
import 'package:note_app/routes/route_links.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/utils/enum.dart';
import 'package:note_app/utils/extensions.dart';
import 'package:note_app/widgets/confirm_dialog.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class HomeController extends GetxController {
  final RxList<Note> notes = RxList.empty();
  final String titleControl = 'title';
  final String descriptionControl = 'description';
  late FormGroup formGroup;
  RxBool readOnly = false.obs;
  EditorScreenType type = EditorScreenType.newNote;
  @override
  void onInit() async {
    notes.value = await AppStorage.loadNotes();
    formGroup = FormGroup(
      {
        titleControl: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        descriptionControl: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      },
    );

    super.onInit();
  }

  void onTapCreate() {
    type = EditorScreenType.newNote;
    formGroup.reset();
    Get.to(
      EditorScreen(type: type),
      transition: Transition.noTransition,
    );
  }

  void updateNote(Note note) async {
    int index = notes.indexWhere((data) => data.id == note.id);
    notes[index].title = formGroup.rawValue[titleControl].toString();
    notes[index].description =
        formGroup.rawValue[descriptionControl].toString();
    notes.refresh();
    AppStorage.saveNotes(notes);
    Get.back();
    Get.back();
  }

  void onTapSave(BuildContext context, Note? note) {
    if (!formGroup.valid) {
      showErrorSnackBar(
        errMsg: "Note cant be empty",
      );
      return;
    }
    AppColors.scaffoldBackgroundColor.value = AppColors.primary;
    ConfirmDialog(
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      title: 'Save Changes',
      buttons: [
        CustomButton(
          color: AppColors.error,
          onTap: () {
            AppColors.scaffoldBackgroundColor.value = AppColors.background1;
            Get.back();
          },
          child: Text(
            'Discard',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        CustomButton(
          color: AppColors.sccess,
          onTap: () {
            if (type == EditorScreenType.newNote) {
              addNote();
            } else {
              updateNote(note!);
            }
            AppColors.scaffoldBackgroundColor.value = AppColors.background1;
          },
          child: Text(
            'Save',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    ).scaleDilogOpen(context);
  }

  void removeNote(int index) async {
    await AppStorage.removeNote(notes[index].id);
    notes.removeAt(index);
  }

  void onTapNote(int index) {
    Get.toNamed(RouteLinks.editor, arguments: notes[index]);
  }

  void addNote() {
    final Note note = Note(
      id: uuid.v4().hashCode,
      title: formGroup.rawValue[titleControl].toString(),
      description: formGroup.rawValue[descriptionControl].toString(),
    );
    notes.add(note);
    AppStorage.addNote(note);
    Get.back();

    Get.back();
  }

  void showErrorSnackBar(
      {String? errMsg, Duration duration = const Duration(seconds: 2)}) {
    Get.snackbar(
      'Error',
      errMsg ?? "",
      colorText: Colors.white,
      backgroundColor: AppColors.error,
      duration: duration,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> showSuccesSnackBar({
    String? succesMsg,
    Duration duration = const Duration(seconds: 2),
  }) async {
    Get.snackbar(
      'Succes',
      succesMsg ?? "",
      colorText: Colors.white,
      backgroundColor: Colors.green,
      duration: duration,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
