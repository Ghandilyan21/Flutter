import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.ations,
  });
  final Widget? title;
  final List<Widget> ations;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title,
      actions: ations,
      toolbarHeight: preferredSize.height + 150,
      excludeHeaderSemantics: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
