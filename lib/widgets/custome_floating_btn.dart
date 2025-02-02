import 'package:flutter/material.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/utils/assets.dart';

class CustomeFloatingBtn extends StatelessWidget {
  const CustomeFloatingBtn({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width * (70 / 414),
        width: width * (70 / 414),
        decoration: BoxDecoration(
          color: AppColors.background1,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(-4, 4),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Image.asset(AppAssets.add),
      ),
    );
  }
}
