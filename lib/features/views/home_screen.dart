
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/controllers/home_controller.dart';
import 'package:note_app/routes/route_links.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/style/text_style.dart';
import 'package:note_app/utils/assets.dart';
import 'package:note_app/utils/extensions.dart';
import 'package:note_app/widgets/app_bar.dart';
import 'package:note_app/widgets/custome_floating_btn.dart';
import 'package:note_app/widgets/custome_icon_btn.dart';
import 'package:note_app/widgets/empty_home_body.dart';
import 'package:note_app/widgets/info_dialog.dart';
import 'package:note_app/widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = Get.put(HomeController());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.readOnly.value = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          "Notes",
          style: AppTextStyle.white,
        ),
        ations: [
          SizedBox(
            width: 20,
          ),
          CustomeIconBtn(
            bgColor: AppColors.primary,
            icon: Image.asset(AppAssets.search),
            onTap: () {
              Get.toNamed(RouteLinks.search);
            },
          ),
          SizedBox(
            width: 20,
          ),
          CustomeIconBtn(
            bgColor: AppColors.primary,
            icon: Image.asset(AppAssets.infoOutline),
            onTap: () {
              AppColors.scaffoldBackgroundColor.value = AppColors.primary;
              InfoDialog().scaleDilogOpen(context);
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Obx(
          () {
            return _controller.notes.isNotEmpty
                ? ListView.separated(
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Dismissible(
                          key: ValueKey(_controller.notes[index].id),
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.red,
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          resizeDuration: Duration(seconds: 1),
                          onDismissed: (direction) async {
                            _controller.removeNote(index);
                          },
                          child: NoteItem(
                              note: _controller.notes[index],
                              onTap: () {
                                _controller.onTapNote(index);
                              }),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: _controller.notes.length)
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      EmptyHomeBody(),
                      Text(
                        'Create your first note !',
                        style: AppTextStyle.white.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ));
          },
        ),
      ),
      floatingActionButton: CustomeFloatingBtn(
        onTap: _controller.onTapCreate,
      ),
    );
  }
}
