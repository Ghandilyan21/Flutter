import 'package:flutter/material.dart';
import 'package:note_app/style/colors.dart';
import 'package:note_app/style/text_style.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) =>
          AppColors.scaffoldBackgroundColor.value = AppColors.background1,
      child: Dialog(
        shadowColor: AppColors.primary,
        backgroundColor: AppColors.background1,
        child: Container(
          width: width * (330 / 414),
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 38),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Designed by - ',
                style: AppTextStyle.grey,
              ),
              Text(
                'Redesigned by - ',
                style: AppTextStyle.grey,
              ),
              Text(
                'Illustrations - ',
                style: AppTextStyle.grey,
              ),
              Text(
                'Icons - ',
                style: AppTextStyle.grey,
              ),
              Text(
                'Font - ',
                style: AppTextStyle.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made by',
                    style: AppTextStyle.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
