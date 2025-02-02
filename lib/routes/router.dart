import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/features/model/note.dart';
import 'package:note_app/features/views/editor_screen.dart';
import 'package:note_app/features/views/home_screen.dart';
import 'package:note_app/features/views/search.dart';
import 'package:note_app/routes/route_links.dart';
import 'package:note_app/utils/enum.dart';

class AppRoute {
  static final AppRoute _singltone = AppRoute._internal();

  factory AppRoute() {
    return _singltone;
  }
  AppRoute._internal();

  final main = Get.nestedKey(0);
  String currentNestedRoute = RouteLinks.home;
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLinks.home:
        return pageRouteBuilder(
          page: HomeScreen(),
          settings: settings,
        );
      case RouteLinks.editor:
        return pageRouteBuilder(
          page: EditorScreen(
            type: settings.arguments is Note
                ? EditorScreenType.editNote
                : EditorScreenType.newNote,
          ),
          settings: settings,
        );
      case RouteLinks.search:
        return pageRouteBuilder(
          page: Search(),
          settings: settings,
        );
      default:
        return pageRouteBuilder(
          page: HomeScreen(),
        );
    }
  }

  GetPageRoute pageRouteBuilder({
    required Widget page,
    RouteSettings? settings,
  }) {
    return GetPageRoute(
      page: () => page,
      transition: Transition.noTransition,
      settings: settings,
    );
  }
}
