import 'package:flutter/material.dart';

class RecommentView extends StatefulWidget {
  const RecommentView({Key? key}) : super(key: key);

  @override
  State<RecommentView> createState() => RecommentViewState();
}

class RecommentViewState extends State<RecommentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("recomment_view"),
    );
  }
}
