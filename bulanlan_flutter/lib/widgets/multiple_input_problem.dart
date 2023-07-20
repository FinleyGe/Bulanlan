import 'package:flutter/material.dart';

class MultipleInputProblem extends StatefulWidget {
  final String content;

  final List<String> problems;
  Function callBack;

  MultipleInputProblem({
    Key? key,
    required this.content,
    required this.problems,
    required this.callBack,
  }) : super(key: key);

  @override
  State<MultipleInputProblem> createState() => MultipleInputProblemState();
}

class MultipleInputProblemState extends State<MultipleInputProblem> {
  List<String> _value = [];
  @override
  void initState() {
    super.initState();
    _value = List.filled(widget.problems.length, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 0.4 * MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Text(
              widget.content,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.problems.length,
          itemBuilder: (BuildContext context, int index) {
            return TextFormField(
              decoration: InputDecoration(
                labelText: widget.problems[index],
              ),
              onChanged: (String value) {
                setState(() {
                  _value[index] = value;
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
