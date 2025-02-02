import 'package:get/get.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/storage/app_storage.dart';

class SerachController extends GetxController {
  List<Note> allNotes = [];
  RxList<Note> searchedNotes = RxList.empty();
  RxString searchText = ''.obs;
  RxBool loading = false.obs;
  RxBool noData = true.obs;
  @override
  void onInit() async {
    allNotes = await AppStorage.loadNotes();
    searchedNotes.value = [];
    debounce(searchText, (callback) {
      if (callback.isEmpty) {
        noData.value = true;
        searchedNotes.value = [];
      }
      loading.value = true;
      noData.value = false;
      searchedNotes.value =
          allNotes.where((elem) => elem.title.contains(callback)).toList();
      Future.delayed(Duration(milliseconds: 300), () {
        loading.value = false;
      });
      if (searchedNotes.isEmpty) {
        noData.value = true;
      }
    });
    super.onInit();
  }
}
