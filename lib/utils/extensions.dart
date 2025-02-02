import 'package:flutter/material.dart';

extension ScaleDialogOpen on Widget {
  Future<void> scaleDilogOpen(BuildContext context) {
    return showGeneralDialog<void>(
      transitionBuilder: (context, a1, a2, widget) {
        var tween = Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.bounceInOut));
        return Transform.scale(
          scale: a1.drive(tween).value,
          child: widget,
        );
      },
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 350),
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return this;
      },
    );
  }
}
