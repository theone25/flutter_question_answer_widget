import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/question_text_widget.dart';

/// MultiSelectionWidget
class MultiSelectionWidget extends StatefulWidget {
  /// it's question text and can change the text style also
  final String question;

  /// answerList - it'll contain list of all answers.
  final List answerList;

  /// based on answerList the selected answered the widget will be update
  final List answeredList;

  /// onChanged will give the selected value
  /// ex:
  /// onChanged: (value){
  ///   setState((){
  ///     oldValue = value;
  ///   });
  /// }
  final ValueChanged<String> onChanged;

  /// default answerMargin is EdgeInsets.all(10.0) and can update the answerMargin as per the requirements
  final EdgeInsets answerMargin;

  /// answer widget width - default width : 100.0
  final double answerWidth;

  /// answer widget height - default height : 40.0
  final double answerHeight;

  /// default questionTextStyle is TextStyle(fontSize: 16, fontWeight: FontWeight.bold) and
  /// can update the questionTextStyle as per the requirements
  final TextStyle questionTextStyle;

  /// default selectedAnswerBackGroundColor is Colors.blue and can update the selectedAnswerBackGroundColor as per the requirements
  final Color selectedAnswerBackGroundColor;

  /// default unSelectedAnswerBackGroundColor is Colors.white and can update the unSelectedAnswerBackGroundColor as per the requirements
  final Color unSelectedAnswerBackGroundColor;

  /// default selectedAnswerTextColor is Colors.white and can update the selectedAnswerTextColor as per the requirements
  final Color selectedAnswerTextColor;

  /// default unSelectedAnswerTextColor is Colors.black and can update the unSelectedAnswerTextColor as per the requirements
  final Color unSelectedAnswerTextColor;

  /// default answersFontSize is 14 and can update the answersFontSize as per the requirements
  final double answersFontSize;

  /// default answersFontFamily is flutter-default and can update the answersFontFamily as per the requirements
  final String answersFontFamily;

  /// default questionMaxLine is 1 and can update the questionMaxLine as per the requirements
  final int questionMaxLine;

  /// default questionOverFlow is TextOverflow.ellipsis and can update the questionOverFlow as per the requirements
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
  /// main build
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// question widget
          QuestionTextWidget(
            title: widget.question,
            textStyle: widget.questionTextStyle,
            maxLine: widget.questionMaxLine,
            questionOverFlow: widget.questionOverFlow,
          ),

          /// default for Q & A padding
          SizedBox(height: 10),

          /// answer list widget
          _listView(),
        ],
      ),
    );
  }

  /// answer list widget
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
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: _selectedValue(index)
                        ? _selectedBackgroundColor(index)
                        : Colors.black)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlatButton(
                onPressed: () {
                  widget.onChanged(widget.answerList[index]);
                },
                padding: EdgeInsets.only(left: 5, right: 5),
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

  /// for selected widget update
  bool _selectedValue(int index) {
    return (widget.answeredList != null &&
        widget.answeredList.contains(widget.answerList[index]));
  }

  /// for selected widget update
  Color _selectedBackgroundColor(int index) {
    if (widget.selectedAnswerBackGroundColor == null) {
      return Colors.blue;
    }
    return widget.selectedAnswerBackGroundColor;
  }

  /// for selected widget update
  Color _unSelectedBackgroundColor(int index) {
    if (widget.unSelectedAnswerBackGroundColor == null) {
      return Colors.white;
    }
    return widget.unSelectedAnswerBackGroundColor;
  }

  /// for selected widget update
  Color _selectedAnswerTextColor(int index) {
    if (widget.selectedAnswerTextColor == null) {
      return Colors.white;
    }
    return widget.selectedAnswerTextColor;
  }

  /// for selected widget update
  Color _unSelectedAnswerTextColor(int index) {
    if (widget.selectedAnswerTextColor == null) {
      return Colors.black;
    }
    return widget.unSelectedAnswerTextColor;
  }
}
