import 'package:flutter/material.dart';
import 'package:note_app/utils/assets.dart';

class EmptyHomeBody extends StatelessWidget {
  const EmptyHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.noteBg,
        ),
      ],
    );
  }
}
