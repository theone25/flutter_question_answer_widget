import 'package:flutter/material.dart';

class QuestionTextWidget extends StatelessWidget {
  final String title;
  TextStyle textStyle;
  final TextOverflow questionOverFlow;
  final int maxLine;

  QuestionTextWidget(
      {Key key,
      @required this.title,
      this.textStyle,
      this.questionOverFlow = TextOverflow.ellipsis,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (textStyle == null) {
      textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: textStyle,
        overflow: questionOverFlow,
        maxLines: maxLine,
      ),
    );
  }
}
