import 'package:flutter/material.dart';

enum ProblemType {
  singleChoice,
  multipleChoice,
}

class Problem extends StatefulWidget {
  Problem({
    Key? key,
    required this.content,
    required this.type,
    required this.choices,
    required this.callBack,
  }) : super(key: key);
  final String content;
  final ProblemType type;
  final List<String> choices;
  Function(List<int>) callBack = (List<int> answer) {};

  @override
  State<Problem> createState() => ProblemState();
}

class ProblemState extends State<Problem> {
  List<int> answers = [];
  void _selectAnswer(int index) {
    if (widget.type == ProblemType.singleChoice) {
      answers.clear();
      answers.add(index);
    } else {
      if (answers.contains(index)) {
        answers.remove(index);
      } else {
        answers.add(index);
      }
    }
    setState(() {});
    widget.callBack(answers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 0.5 * MediaQuery.of(context).size.height,
                maxWidth: 0.9 * MediaQuery.of(context).size.width),
            child: SingleChildScrollView(
              child: Text(widget.content, style: const TextStyle(fontSize: 20)),
              scrollDirection: Axis.vertical,
            )),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.choices.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    _selectAnswer(index);
                  },
                  child: Text(widget.choices[index],
                      style: const TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers.contains(index) ? Colors.blue : Colors.white,
                    padding: const EdgeInsets.all(10),
                  ),
                ));
          },
        ),
      ],
    );
  }
}
