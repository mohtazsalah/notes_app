import 'package:flutter/material.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view_model/notes_view_model.dart';
import 'package:notes_app/widget/custom_note_item.dart';
import 'package:provider/provider.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    Key? key,
  }) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {

  @override
  void initState() {
    super.initState();
    Provider.of<NotesViewModel>(context,listen: false).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> list = [];
    if(Provider.of<NotesViewModel>(context).noteList.isEmpty){
      list = [] ;
    }else {
      list = Provider
          .of<NotesViewModel>(context)
          .noteList;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 5 , bottom: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        // physics: ,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: CustomNoteItem(
              model: list[index],
              onPress: () {
                print('clicked');
              },
            ),
          );
        },
      ),
    );
  }
}
