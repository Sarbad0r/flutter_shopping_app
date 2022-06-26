import 'package:flutter/cupertino.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  Color? backgroundColor;
  Color? iconColor;
  double? size;
  double? iconsize;
  AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.iconsize = 16,
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size! / 2),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconsize,
          ),
        ),
      ),
    );
  }
}
