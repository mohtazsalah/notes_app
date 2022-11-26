import 'package:flutter/cupertino.dart';
import 'package:notes_app/data/my_database.dart';
import 'package:notes_app/model/note_model.dart';

class NotesViewModel extends ChangeNotifier{
  List<NoteModel> _noteList = [];

  fetchNotes() async {
    _noteList = await MyDatabase().notes();
    notifyListeners();
  }

  // deleteItem(List<NoteModel> list , int index) async {
  //   await MyDatabase().deleteData("DELETE FROM 'notes' WHERE id = ${list[index].id}");
  //   _noteList = await MyDatabase().notes();
  //   notifyListeners();
  // }

  deleteItem(NoteModel model) async {
    await MyDatabase().deleteNote(model);
    // _noteList = await MyDatabase().notes();
    notifyListeners();
  }

  addItem(NoteModel model) async {
    await MyDatabase().insertNote(model);
    // _noteList = await MyDatabase().notes();
    notifyListeners();
  }

  List<NoteModel> get noteList => _noteList ;


}