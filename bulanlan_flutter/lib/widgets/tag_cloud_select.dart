import 'package:flutter/material.dart';

class TagCloudSelect extends StatefulWidget {
  const TagCloudSelect({Key? key}) : super(key: key);

  @override
  State<TagCloudSelect> createState() => _TagCloudSelectState();
}

class _TagCloudSelectState extends State<TagCloudSelect> {
  List<String> _selected = [];
  List<String> _tags = [
    '历史',
    '人文',
    '文学',
    '艺术',
    '逻辑学',
    '弗朗西斯·培根',
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: _tags.map((e) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (_selected.contains(e)) {
                _selected.remove(e);
              } else {
                _selected.add(e);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: _selected.contains(e) ? Colors.blue : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(e),
          ),
        );
      }).toList(),
    );
  }
}
