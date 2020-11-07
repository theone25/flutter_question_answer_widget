import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/question_text_widget.dart';

/// SingleCheckSelectionWidget
class SingleCheckSelectionWidget extends StatefulWidget {
  /// it's question text and can change the text style also
  final String question;

  /// answerList - it'll contain list of all answers.
  final List answerList;

  /// based on answerList the selected answered the widget will be update
  final String answered;

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

  /// default questionTextStyle is TextStyle(fontSize: 16, fontWeight: FontWeight.bold) and
  /// can update the questionTextStyle as per the requirements
  final TextStyle questionTextStyle;

  /// default activeColor is Colors.blue and can update the activeColor as per the requirements
  final Color activeColor;

  /// default answerTextColor is Colors.black and can update the answerTextColor as per the requirements
  final Color answerTextColor;

  /// default answersFontSize is 14 and can update the answersFontSize as per the requirements
  final double answersFontSize;

  /// default answersFontFamily is flutter-default and can update the answersFontFamily as per the requirements
  final String answersFontFamily;

  /// default questionMaxLine is 1 and can update the questionMaxLine as per the requirements
  final int questionMaxLine;

  /// default questionOverFlow is TextOverflow.ellipsis and can update the questionOverFlow as per the requirements
  final TextOverflow questionOverFlow;

  const SingleCheckSelectionWidget(
      {Key key,
      @required this.question,
      @required this.answerList,
      this.answered,
      this.onChanged,
      this.answerMargin,
      this.questionTextStyle,
      this.activeColor,
      this.answersFontSize,
      this.answersFontFamily,
      this.questionMaxLine,
      this.questionOverFlow,
      this.answerTextColor})
      : super(key: key);

  @override
  _SingleCheckSelectionWidgetState createState() =>
      _SingleCheckSelectionWidgetState();
}

class _SingleCheckSelectionWidgetState
    extends State<SingleCheckSelectionWidget> {
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
      margin: (widget.answerMargin == null)
          ? EdgeInsets.all(10.0)
          : widget.answerMargin,
      child: ListView.builder(
        itemCount: widget.answerList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: _selectedValue(index)
                          ? _activeColor(index)
                          : Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade500, width: 0.5)),
                  child: FlatButton(
                      onPressed: () {
                        widget.onChanged(widget.answerList[index]);
                      },
                      padding: EdgeInsets.all(0),
                      child: _selectedValue(index)
                          ? Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                          : Container()),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.answerList[index],
                    style: TextStyle(
                        color: (widget.answerTextColor == null)
                            ? Colors.black
                            : widget.answerTextColor,
                        fontSize: widget.answersFontSize,
                        fontFamily: widget.answersFontFamily),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  /// for selected widget update
  bool _selectedValue(int index) {
    return (widget.answered != null &&
        widget.answerList[index] == widget.answered);
  }

  /// for selected widget update
  Color _activeColor(int index) {
    if (widget.activeColor == null) {
      return Colors.blue;
    }
    return widget.activeColor;
  }
}
