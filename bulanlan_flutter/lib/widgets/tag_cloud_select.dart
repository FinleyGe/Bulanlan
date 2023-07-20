import 'package:bulanlan_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/api/api.dart' as api;
import 'package:provider/provider.dart';

class TagCloudSelect extends StatefulWidget {
  const TagCloudSelect({Key? key}) : super(key: key);

  @override
  State<TagCloudSelect> createState() => _TagCloudSelectState();
}

class _TagCloudSelectState extends State<TagCloudSelect> {
  List<String> _selected = [];
  List<String> _tags = [];

  void flushTags() {
    api
        .getTags(Provider.of<UserChangeNotifier>(context, listen: false).token)
        .then((res) => {
              setState(() {
                _tags.clear();
                for (var i in res.tags) {
                  _tags.add(i.name);
                }
              })
            });
  }

  void handleUpdateTags() {
    api
        .updateTags(
            Provider.of<UserChangeNotifier>(context, listen: false).token,
            _selected)
        .then((res) => {
              if (res.code == 200)
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("更新成功"),
                  )),
                  Provider.of<UserChangeNotifier>(context, listen: false).tags =
                      _selected,
                  Navigator.of(context).pop(),
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("更新失败"),
                  ))
                }
            });
  }

  @override
  void initState() {
    super.initState();
    flushTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            handleUpdateTags();
          },
        ),
        appBar: AppBar(
          title: const Text("选择标签"),
        ),
        body: Wrap(
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
                  color: _selected.contains(e) ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(e),
              ),
            );
          }).toList(),
        ));
  }
}
