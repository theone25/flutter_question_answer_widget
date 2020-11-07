import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/question_text_widget.dart';

class SingleCheckSelectionWidget extends StatefulWidget {
  final String question;
  final List answerList;
  final String answered;
  final ValueChanged<String> onChanged;
  final EdgeInsets answerMargin;
  final TextStyle questionTextStyle;
  final Color activeColor;
  final Color answerTextColor;
  final double answersFontSize;
  final String answersFontFamily;
  final int questionMaxLine;
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

  bool _selectedValue(int index) {
    return (widget.answered != null &&
        widget.answerList[index] == widget.answered);
  }

  Color _activeColor(int index) {
    if (widget.activeColor == null) {
      return Colors.blue;
    }
    return widget.activeColor;
  }
}
