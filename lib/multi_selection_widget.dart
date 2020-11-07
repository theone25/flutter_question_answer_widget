import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/question_text_widget.dart';

class MultiSelectionWidget extends StatefulWidget {
  final String question;
  final List answerList;
  final List answeredList;
  final ValueChanged<String> onChanged;
  final EdgeInsets answerMargin;
  final double answerWidth;
  final double answerHeight;
  final TextStyle questionTextStyle;
  final Color selectedAnswerBackGroundColor;
  final Color unSelectedAnswerBackGroundColor;
  final Color selectedAnswerTextColor;
  final Color unSelectedAnswerTextColor;
  final double answersFontSize;
  final String answersFontFamily;
  final int questionMaxLine;
  final TextOverflow questionOverFlow;

  const MultiSelectionWidget(
      {Key key,
      @required this.question,
      @required this.answerList,
      this.answeredList,
      this.onChanged,
      this.answerMargin,
      this.answerWidth,
      this.answerHeight,
      this.questionTextStyle,
      this.selectedAnswerBackGroundColor,
      this.unSelectedAnswerBackGroundColor,
      this.selectedAnswerTextColor,
      this.unSelectedAnswerTextColor,
      this.answersFontSize,
      this.answersFontFamily,
      this.questionMaxLine,
      this.questionOverFlow})
      : super(key: key);

  @override
  _MultiSelectionWidgetState createState() => _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends State<MultiSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionTextWidget(
            title: widget.question,
            textStyle: widget.questionTextStyle,
            maxLine: widget.questionMaxLine,
            questionOverFlow: widget.questionOverFlow,
          ),
          SizedBox(height: 10),
          _listView(),
        ],
      ),
    );
  }

  Widget _listView() {
    return Container(
      width: (widget.answerWidth == null) ? 100.0 : widget.answerWidth,
      margin: (widget.answerMargin == null)
          ? EdgeInsets.all(10.0)
          : widget.answerMargin,
      child: ListView.builder(
        itemCount: widget.answerList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            height: (widget.answerHeight == null) ? 40.0 : widget.answerHeight,
            margin: EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
                color: _selectedValue(index)
                    ? _selectedBackgroundColor(index)
                    : _unSelectedBackgroundColor(index),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: _selectedValue(index)
                        ? _selectedBackgroundColor(index)
                        : Colors.black)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FlatButton(
                onPressed: () {
                  widget.onChanged(widget.answerList[index]);
                },
                padding: EdgeInsets.all(0),
                child: Text(
                  widget.answerList[index],
                  style: TextStyle(
                      color: _selectedValue(index)
                          ? _selectedAnswerTextColor(index)
                          : _unSelectedAnswerTextColor(index),
                      fontSize: widget.answersFontSize,
                      fontFamily: widget.answersFontFamily),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _selectedValue(int index) {
    return (widget.answeredList != null &&
        widget.answeredList.contains(widget.answerList[index]));
  }

  Color _selectedBackgroundColor(int index) {
    if (widget.selectedAnswerBackGroundColor == null) {
      return Colors.blue;
    }
    return widget.selectedAnswerBackGroundColor;
  }

  Color _unSelectedBackgroundColor(int index) {
    if (widget.unSelectedAnswerBackGroundColor == null) {
      return Colors.white;
    }
    return widget.unSelectedAnswerBackGroundColor;
  }

  Color _selectedAnswerTextColor(int index) {
    if (widget.selectedAnswerTextColor == null) {
      return Colors.white;
    }
    return widget.selectedAnswerTextColor;
  }

  Color _unSelectedAnswerTextColor(int index) {
    if (widget.selectedAnswerTextColor == null) {
      return Colors.black;
    }
    return widget.unSelectedAnswerTextColor;
  }
}
