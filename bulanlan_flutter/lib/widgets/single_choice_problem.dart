import 'package:flutter/material.dart';

class SingleChoiceProblem extends StatefulWidget {
  String content;

  List<String> choices;
  Function callBack = (List<int> value) {};

  SingleChoiceProblem({
    Key? key,
    required this.content,
    required this.choices,
    required this.callBack,
  }) : super(key: key);

  @override
  State<SingleChoiceProblem> createState() => SingleChoiceProblemState();
}

class SingleChoiceProblemState extends State<SingleChoiceProblem> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 0.4 * MediaQuery.of(context).size.height,
            maxWidth: 0.8 * MediaQuery.of(context).size.width,
          ),
          child: Text(widget.content),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.choices.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              title: Text(widget.choices[index]),
              value: index,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = value!;
                });
                widget.callBack(value!);
              },
            );
          },
        ),
      ],
    );
  }
}
