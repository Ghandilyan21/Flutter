import 'package:flutter/material.dart';
import 'package:note_app/style/colors.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.buttons,
  });
  final Icon icon;
  final String title;
  final List<Widget> buttons;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: Dialog(
        shadowColor: AppColors.primary,
        backgroundColor: AppColors.background1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              color: AppColors.background1,
              borderRadius: BorderRadius.circular(28)),
          clipBehavior: Clip.hardEdge,
          height: height * (236 / 896),
          width: width * (330 / 414),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              icon,
              Text(
                title,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
