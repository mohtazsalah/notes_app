import 'package:flutter/material.dart';
import 'package:notes_app/data/my_database.dart';
import 'package:notes_app/model/note_model.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                )
              ),
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
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(

              onPressed: () {
                MyDatabase db = MyDatabase();
                db.insertNote(NoteModel(
                    title: 'test',
                    subTitle: 'test add to local data base ',
                    date: '20 May 2022'
                )
                );

              }, child: Text(
              'add',
            ),
            ),
          ),
        ],
      ),
    );
  }
}
