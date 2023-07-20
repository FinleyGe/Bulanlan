import 'package:bulanlan_flutter/widgets/input_problem.dart';
import 'package:bulanlan_flutter/widgets/multiple_choice_problem.dart';
import 'package:bulanlan_flutter/widgets/problem.dart';
import 'package:bulanlan_flutter/widgets/single_choice_problem.dart';
import 'package:bulanlan_flutter/widgets/user_info.dart';
import 'package:bulanlan_flutter/widgets/multiple_input_problem.dart';
import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/api/api.dart' as api;
import 'package:provider/provider.dart';

import '../state.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => TestViewState();
}

class TestViewState extends State<TestView> {
  int _problemIndex = 0;
  String level = '';
  int answer1 = 0;
  int answer2 = 0;
  int answer3 = 0;
  List<int> answer4 = [0, 0, 0, 0];
  List<int> answer5 = [0, 0, 0, 0];

  void getAnswer(dynamic answer) {
    switch (_problemIndex) {
      case 0:
        answer1 = answer;
        break;
      case 1:
        answer2 = int.parse(answer);
        break;
      case 2:
        answer3 = answer;
      case 3:
        answer4 = (answer as List<String>).map((e) => int.parse(e)).toList();
      case 4:
        answer5 = (answer as List<String>).map((e) => int.parse(e)).toList();
    }
  }

  void updateLevel() {
    api
        .updateLevel(
            Provider.of<UserChangeNotifier>(context, listen: false).token,
            level)
        .then((res) => {
              if (res.code == 200)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("更新成功, 等级为$level"),
                  )),
                  Provider.of<UserChangeNotifier>(context, listen: false)
                      .level = level,
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("更新失败"),
                  ))
                }
            });
  }

  void nextProblem() {
    // if (level.length == 1) {
    //   getLevel();
    //   Navigator.of(context).pop();
    //   return;
    // }
    setState(() {
      if (_problemIndex == 0) {
        if (answer1 == 4) {
          _problemIndex = 2;
        } else {
          _problemIndex = 1;
        }
        return;
      } else if (_problemIndex == 1) {
        double score = 0;
        if (answer1 == 0 || answer1 == 1) {
          score = answer2 / 710;
        } else {
          score = answer2 / 100;
        }
        if (score < 0.6) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("您未通过此考试, 请重新输入或返回上一步"),
          ));
          return;
        }
        if (answer1 == 0) {
          if (score >= 0.85) {
            level = 'B';
            updateLevel();
          } else if (score >= 0.7) {
            level = 'AB';
            _problemIndex = 2;
          } else {
            level = 'A';
            updateLevel();
          }
        } else if (answer1 == 1) {
          if (score >= 0.85) {
            level = 'C';
            updateLevel();
          } else if (score >= 0.7) {
            level = 'BC';
            _problemIndex = 2;
          } else {
            level = 'AB';
            _problemIndex = 2;
          }
        } else if (answer1 == 2.0) {
          if (score >= 0.85) {
            level = 'DE';
            _problemIndex = 3;
          } else if (score >= 0.7) {
            level = 'D';
            updateLevel();
          } else {
            level = 'CD';
            _problemIndex = 3;
          }
        } else if (answer1 == 3) {
          if (score >= 0.85) {
            level = 'F';
            updateLevel();
          } else if (score >= 0.7) {
            level = 'EF';
            _problemIndex = 4;
          } else {
            level = 'DE';
            _problemIndex = 4;
          }
        }
      } else if (_problemIndex == 2) {
        if (answer3 == 0) {
          level = level[0];
        } else if (answer3 == 1) {
          level = 'B';
        } else {
          level = level[1];
        }
        updateLevel();
      } else if (_problemIndex == 3 || _problemIndex == 4) {
        int score = (answer4[0] +
            answer4[1] +
            answer4[2] +
            answer4[3] +
            answer5[0] +
            answer5[1] +
            answer5[2] +
            answer5[3]);

        if (score > 12) {
          level = level[1];
        } else {
          level = level[0];
        }
        updateLevel();
      }
    });
  }

  void previousProblem() {
    setState(() {
      switch (_problemIndex) {
        case 1:
          _problemIndex = 0;
          break;
        case 2:
          if (answer1 == 4) {
            _problemIndex = 0;
          } else {
            _problemIndex = 1;
          }
          break;
        case 3:
          _problemIndex = 1;
          break;
        case 4:
          _problemIndex = 1;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('等级测试'),
        ),
        body: Column(
          children: [
            IndexedStack(
              index: _problemIndex,
              children: [
                SingleChoiceProblem(
                  content: '你上一次通过的等级考试',
                  choices: const ['四级', '六级', '专四', '专八', '还没有通过等级考试'],
                  callBack: getAnswer,
                ),
                InputProblem(
                  content: '你上一次等级考试的分数',
                  callBack: getAnswer,
                ),
                SingleChoiceProblem(
                  content: '您曾读完过多少英语原版书',
                  choices: const ['从未读完过', '读完过一本', '读完过两本及以上'],
                  callBack: getAnswer,
                ),
                MultipleInputProblem(
                  content:
                      "阅读下列语段，自我评分\n Alive, Miss Emily had been a tradition, a duty, and a care; a sort of hereditary obligation upon the town, dating from that day in 1894 when Colonel Sartoris, the mayor--he who fathered the edict that no Negro woman should appear on the streets without an apron-remitted her taxes, the dispensation dating from the death of her father on into perpetuity. Not that Miss Emily would have accepted charity. Colonel Sartoris invented an involved tale to the effect that Miss Emily's father had loaned money to the town, which the town, as a matter of business, preferred this way of repaying. Only a man of Colonel Sartoris' generation and thought could have invented it, and only a woman could have believed it.",
                  problems: const [
                    '我能理解文章中所有单词的意思(1-5)',
                    '我能理解难句的意思，并用自己的话转述（1-5）',
                    '我能理解作者的观点和态度（1-5）',
                    '我能总结段落大意（1-5）',
                  ],
                  callBack: getAnswer,
                ),
                MultipleInputProblem(
                  content:
                      "阅读下列语段，自我评分\n Simple-minded people tend to equate the symbol with what it stands for, to attribute to things and events some of the qualities expressed by the words in terms of which the propagandist has chosen, for his own purposes, to talk about them. Consider a simple example. Most cosmetics are made of lanolin, which is a mixture of purified wool fat and water beaten up into an emulsion. This emulsion has many valuable properties: it penetrates the skin, it does not become rancid, it is mildly antiseptic and so forth. But the commercial propagandists do not speak about the genuine virtues of the emulsion. They give it some picturesquely voluptuous name, talk ecstatically and misleadingly about feminine beauty and show pictures of gorgeous blondes nourishing their tissues with skin food. \"The cosmetic manufacturers,\" one of their number has written, \"are not selling lanolin, they are selling hope.\" For this hope, this fraudulent implication of a promise that they will be transfigured, women will pay ten or twenty times the value of the emulsion which the propagandists have so skillfully related, by means of misleading symbols, to a deep-seated and almost universal feminine wish—the wish to be more attractive to members of the opposite sex.",
                  problems: const [
                    '我能理解文章中所有单词的意思(1-5)',
                    '我能理解难句的意思，并用自己的话转述（1-5）',
                    '我能理解作者的观点和态度（1-5）',
                    '我能总结段落大意（1-5）',
                  ],
                  callBack: getAnswer,
                ),
                Text('你的等级为：$level'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    previousProblem();
                  },
                  child: const Text('上一题'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nextProblem();
                  },
                  child: const Text('下一题'),
                ),
              ],
            ),
          ],
        ));
  }
}
