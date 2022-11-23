import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.radius,
    required this.icon,
    required this.size
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final double radius;
  final IconData icon ;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Icon(
          icon ,
          size: size,
        ),
      ),
    );
  }
}
