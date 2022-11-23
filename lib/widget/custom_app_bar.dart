import 'package:flutter/material.dart';
import 'package:notes_app/widget/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.textSize
  }) : super(key: key);

  final String title ;
  final double textSize ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          const Spacer(),
          const CustomIcon(
              height: 45,
              width: 45,
              color: Colors.white,
              radius: 16,
              icon: Icons.search,
              size: 26,
          ),
        ],
      ),
    );
  }
}
