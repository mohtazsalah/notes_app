import 'package:flutter/cupertino.dart';
import 'package:notes_app/data/my_database.dart';
import 'package:notes_app/model/note_model.dart';

class NotesViewModel extends ChangeNotifier{
  List<NoteModel> _noteList = [];

  fetchNotes() async {
    _noteList = await MyDatabase().notes();
    notifyListeners();
  }

  List<NoteModel> get noteList => _noteList ;

}