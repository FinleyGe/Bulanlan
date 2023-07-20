import 'package:bulanlan_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bulanlan_flutter/api/api.dart' as api;

class MyBook {
  MyBook({
    required this.name,
    required this.author,
    required this.tags,
    required this.level,
  });
  String name = "";
  String author = "";
  List<String> tags = [];
  String level = "";
}

class RecommentView extends StatefulWidget {
  const RecommentView({Key? key}) : super(key: key);

  @override
  State<RecommentView> createState() => RecommentViewState();
}

class RecommentViewState extends State<RecommentView> {
  List<MyBook> books = [];

  void getBooks() {
    books = [];
    api
        .getBooks(Provider.of<UserChangeNotifier>(context, listen: false).token)
        .then(
          (res) => {
            setState(() {
              for (var book in res.books) {
                List<String> tags = [];

                for (var tag in book.tags) {
                  tags.add(tag.name);
                }

                books.add(
                  MyBook(
                    name: book.name,
                    tags: tags,
                    author: book.author,
                    level: book.level,
                  ),
                );
              }
            })
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserChangeNotifier>(context).token == "") {
      return const Center(
        child: TextButton(
          onPressed: null,
          child: Text("请先登录"),
        ),
      );
    } else if (Provider.of<UserChangeNotifier>(context).level == "") {
      return Center(
        child: TextButton(
          onPressed: () => Navigator.of(context).pushNamed("/test"),
          child: const Text("请先进行等级测试"),
        ),
      );
    } else {
      return Column(children: [
        TextButton(
          onPressed: () => getBooks(),
          child: const Text("刷新", style: TextStyle(fontSize: 12)),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(books[index].name,
                            style: const TextStyle(fontSize: 20)),
                        Text(books[index].author,
                            style: const TextStyle(fontSize: 15)),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     for (var tag in books[index].tags)
                        //       Text(tag + "  ",
                        //           style: const TextStyle(color: Colors.blue)),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ]);
    }
  }
}
