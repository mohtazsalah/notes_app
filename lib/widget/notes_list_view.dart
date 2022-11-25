import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
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

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<NotesViewModel>(context,listen: false).fetchNotes();
  // }

  @override
  Widget build(BuildContext context) {
    Color color = firstColor;
    final provider = Provider.of<NotesViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5 , bottom: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: provider.noteList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: CustomNoteItem(
              model: provider.noteList[index],
              onPress: () {
                Provider.of<NotesViewModel>(context , listen: false).deleteItem(provider.noteList, index);
              },
            ),
          );
        },
      ),
    );
  }
}
