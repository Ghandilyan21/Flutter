import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/controllers/serach_controller.dart';
import 'package:note_app/routes/route_links.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/style/text_style.dart';
import 'package:note_app/utils/assets.dart';
import 'package:note_app/widgets/empty_home_body.dart';
import 'package:note_app/widgets/note_item.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SerachController _controller;

  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    _controller = Get.put(SerachController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(right: 27, left: 27, top: 30, bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Search by the keyword...',
                        hintStyle: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    controller: _textController,
                    onChanged: (val) => _controller.searchText.value = val,
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _controller.searchText.value = '';
                    Future.delayed(
                      Duration(
                        seconds: 1,
                      ),
                      () {
                        _textController.clear();
                        _controller.searchedNotes.value = [];
                        _controller.noData.value = true;
                      },
                    );
                  },
                  icon: Image.asset(AppAssets.close),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Obx(
                () => _controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _controller.noData.value
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                EmptyHomeBody(),
                                Text(
                                  'File not found. Try searching again.',
                                  style: AppTextStyle.white.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return NoteItem(
                                note: _controller.searchedNotes[index],
                                onTap: () {
                                  Get.toNamed(RouteLinks.editor,
                                      arguments:
                                          _controller.searchedNotes[index]);
                                },
                              );
                            },
                            itemCount: _controller.searchedNotes.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
