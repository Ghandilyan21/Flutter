import 'dart:convert';
import 'package:note_app/features/model/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static const String _key = 'notes';

  static Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList =
        notes.map((note) => jsonEncode(note.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_key);

    if (jsonList == null) return [];

    return jsonList.map((json) => Note.fromJson(jsonDecode(json))).toList();
  }

  static Future<void> addNote(Note note) async {
    List<Note> notes = await loadNotes();
    notes.add(note);
    await saveNotes(notes);
  }

  static Future<void> removeNote(int noteId) async {
    List<Note> notes = await loadNotes();
    notes.removeWhere((note) => note.id == noteId);
    await saveNotes(notes);
    
  }
}
