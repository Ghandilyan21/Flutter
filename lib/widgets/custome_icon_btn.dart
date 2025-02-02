import 'package:flutter/material.dart';

class CustomeIconBtn extends StatelessWidget {
  const CustomeIconBtn({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  });
  final Widget icon;
  final Color bgColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: width * (50 / 414),
          width: width * (50 / 414),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: icon),
    );
  }
}
