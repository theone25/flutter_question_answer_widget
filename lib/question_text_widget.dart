import 'package:flutter/material.dart';

/// QuestionTextWidget
class QuestionTextWidget extends StatelessWidget {
  /// title is the question and it's just String
  final String title;

  /// default questionTextStyle is TextStyle(fontSize: 16, fontWeight: FontWeight.bold) and
  /// can update the questionTextStyle as per the requirements
  final TextStyle textStyle;

  /// default questionOverFlow is TextOverflow.ellipsis and can update the questionOverFlow as per the requirements
  final TextOverflow questionOverFlow;

  /// default questionMaxLine is 1 and can update the questionMaxLine as per the requirements
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
    /// main build
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: (textStyle == null)
            ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            : textStyle,
        overflow: questionOverFlow,
        maxLines: maxLine,
      ),
    );
  }
}
