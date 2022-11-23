import 'package:flutter/material.dart';
import 'package:notes_app/data/my_database.dart';
import 'package:notes_app/widget/add_note_bottom_sheet.dart';
import 'package:notes_app/widget/notes_view_body.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MyDatabase db = MyDatabase();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16) ,
                  topRight: Radius.circular(16)
              ),
            ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              }
          );
        } ,
        backgroundColor: Colors.black.withOpacity(0.7),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}