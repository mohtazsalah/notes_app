import 'package:flutter/material.dart';
import 'package:notes_app/view_model/notes_view_model.dart';
import 'package:notes_app/widget/custom_app_bar.dart';
import 'package:notes_app/widget/notes_list_view.dart';
import 'package:provider/provider.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesViewModel>(
      create: (context) => NotesViewModel(),
      child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: const [
            CustomAppBar(
                title: 'Notes',
                textSize: 28
            ),
            Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
