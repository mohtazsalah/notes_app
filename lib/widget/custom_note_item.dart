import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/model/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    Key? key,
    required this.onPress, required this.model
  }) : super(key: key);

  final Function() onPress;
  final NoteModel model ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 18,
        left: 18,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              '${model.title}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: Text(
                '${model.subTitle}',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 16,
                ),
              ),
            ),
            trailing: IconButton(
                onPressed: onPress,
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 20,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              '${model.date}',
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}