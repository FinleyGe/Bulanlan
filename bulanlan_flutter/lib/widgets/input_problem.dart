import 'package:flutter/material.dart';

class InputProblem extends StatefulWidget {
  InputProblem({Key? key, required this.content, required this.callBack})
      : super(key: key);
  final String content;
  Function callBack;
  @override
  State<InputProblem> createState() => InputProblemState();
}

class InputProblemState extends State<InputProblem> {
  String _value = '0';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 0.4 * MediaQuery.of(context).size.height,
            maxWidth: 0.8 * MediaQuery.of(context).size.width,
          ),
          child: Text(widget.content),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 0.1 * MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextField(
            onChanged: (String value) {
              setState(() {
                _value = value;
              });
              widget.callBack(_value);
            },
          ),
        ),
      ],
    );
  }
}
