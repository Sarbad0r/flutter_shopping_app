import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';
import 'package:flutter_11_hour_lesson/widgets/small_text.dart';

class ExpandedAbleText extends StatefulWidget {
  final String text;
  ExpandedAbleText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedAbleText> createState() => _ExpandedAbleTextState();
}

class _ExpandedAbleTextState extends State<ExpandedAbleText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimension.screenHeight / 5.63;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(text: firstHalf)
            : Column(
                children: [
                  SmallText(
                    text: hiddenText == true
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf),
                    color: AppColors.paraColor,
                    height: 1.8,
                    size: Dimension.fontSize17,
                  ),
                  InkWell(
                    onTap: () {
                      hiddenText = !hiddenText;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText == true? "Show more" : "Hide",
                          color: AppColors.mainColor,
                          size: Dimension.fontSize17,
                        ),
                        Icon(
                          hiddenText == true
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
