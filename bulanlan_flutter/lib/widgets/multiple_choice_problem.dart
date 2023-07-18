import 'package:flutter/material.dart';

class MultipleChoiceProblem extends StatefulWidget {
  final String content;

  final List<String> choices;
  Function callBack;

  MultipleChoiceProblem({
    Key? key,
    required this.content,
    required this.choices,
    required this.callBack,
  }) : super(key: key);

  @override
  State<MultipleChoiceProblem> createState() => MultipleChoiceProblemState();
}

class MultipleChoiceProblemState extends State<MultipleChoiceProblem> {
  List<int> _value = [];
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
            return CheckboxListTile(
              title: Text(widget.choices[index]),
              value: _value.contains(index),
              onChanged: (bool? value) {
                setState(() {
                  if (value!) {
                    _value.add(index);
                  } else {
                    _value.remove(index);
                  }
                });
                widget.callBack(_value);
              },
            );
          },
        ),
      ],
    );
  }
}
