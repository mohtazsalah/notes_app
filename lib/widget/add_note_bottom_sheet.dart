import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesViewModel>(context , listen: false);
    TextEditingController titleController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              controller: subTitleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    subTitleController.text.isEmpty) {
                  return;
                } else {
                  var formatter = DateFormat('dd-MM-yyyy');
                  DateTime now = DateTime.now();
                  String date = formatter.format(now);
                  print(date);
                  provider.addItem(NoteModel(
                      title: titleController.text,
                      subTitle: subTitleController.text,
                      date: date));
                  Navigator.pop(context);
                }
              },
              child: Text(
                'add',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
