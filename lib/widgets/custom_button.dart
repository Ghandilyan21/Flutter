import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.color, required this.child, this.onTap});
  final Color? color;
  final Widget child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(6)),
        height: height * 0.04,
        width: width / 4.5,
        child: child,
      ),
    );
  }
}
