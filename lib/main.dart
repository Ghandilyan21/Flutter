import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/route_links.dart';
import 'package:note_app/routes/router.dart';
import 'package:note_app/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Note App',
        initialRoute: RouteLinks.home,
        navigatorKey: AppRoute().main,
        onGenerateRoute: AppRoute().generateRoute,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.standart,
      ),
    );
  }
}
