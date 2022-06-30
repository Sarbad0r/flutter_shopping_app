import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SmallText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
