import 'package:flutter/material.dart';
import 'package:note_app/features/model/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.onTap,
  });
  final Note note;
  final void Function()? onTap;
  int calculateValue(int x) {
    return (2 * x * x * x + 3 * x * x + 5 * x + 7) ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(
            255,
            (calculateValue(note.id) % 156) + 100,
            (calculateValue(note.id) ~/ 2) % 156 + 100,
            (calculateValue(note.id) ~/ 3) % 156 + 100,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(note.title),
      ),
    );
  }
}
