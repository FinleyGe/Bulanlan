import 'package:bulanlan_flutter/widgets/input_problem.dart';
import 'package:bulanlan_flutter/widgets/multiple_choice_problem.dart';
import 'package:bulanlan_flutter/widgets/problem.dart';
import 'package:bulanlan_flutter/widgets/single_choice_problem.dart';
import 'package:bulanlan_flutter/widgets/user_info.dart';
import 'package:bulanlan_flutter/widgets/multiple_input_problem.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => TestViewState();
}

class TestViewState extends State<TestView> {
  int _problemIndex = 0;
  String level = '';
  List<List<double>> answers = [
    [0],
    [],
    [],
    [],
    [],
  ];

  void getListAnswer(List<int> answer) {
    setState(() {
      answers[_problemIndex] = answer.map((e) => e.toDouble()).toList();
    });
  }

  void getListStringAnswer(List<String> answer) {
    setState(() {
      answers[3] = answer.map((e) => double.parse(e)).toList();
    });
  }

  void getStringAnswer(String answer) {
    setState(() {
      answers[_problemIndex] = [double.parse(answer)];
    });
  }

  int prevIndex = 0;
  void getLevel() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: Text('您的等级为: $level'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  void nextProblem() {
    setState(() {
      prevIndex = _problemIndex;
      if (_problemIndex == 0) {
        if (answers[0][0] == 4) {
          _problemIndex = 2;
        } else {
          _problemIndex = 1;
        }
      } else if (_problemIndex == 1) {
        double score = answers[1][0];
        if (answers[0][0] == 0 || answers[0][0] == 1) {
          score = score / 710;
        } else {
          score = score / 100;
        }
        if (score < 0.6) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('提示'),
                content: const Text('您未通过此考试, 请重新输入或返回上一步'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('确定'),
                  ),
                ],
              );
            },
          );
          return;
        }
        if (answers[0][0] == 0) {
          if (score >= 0.85) {
            level = 'B';
          } else if (score >= 0.7) {
            level = 'AB';
            _problemIndex = 2;
          } else {
            level = 'A';
          }
        } else if (answers[0][0] == 1) {
          if (score >= 0.85) {
            level = 'C';
          } else if (score >= 0.7) {
            level = 'BC';
            _problemIndex = 2;
          } else {
            level = 'AB';
            _problemIndex = 2;
          }
        } else if (answers[0][0] == 2) {
          if (score >= 0.85) {
            level = 'DE';
            _problemIndex = 3;
          } else if (score >= 0.7) {
            level = 'D';
          } else {
            level = 'CD';
            _problemIndex = 2;
          }
        } else if (answers[0][0] == 3) {
          if (score >= 0.85) {
            level = 'F';
          } else if (score >= 0.7) {
            level = 'EF';
            _problemIndex = 4;
          } else {
            level = 'DE';
            _problemIndex = 4;
          }
        }
        answers[1] = [score];
      } else if (_problemIndex == 2) {
        if (answers[2][0] == 0) {
          level = level[0];
        } else if (answers[2][0] == 1) {
          level = 'B';
        } else {
          level = level[1];
        }
      } else if (_problemIndex == 3 || _problemIndex == 4) {
        double score = (answers[3][0] +
            answers[3][1] +
            answers[3][2] +
            answers[3][3] +
            answers[3][4]);
        if (score > 12) {
          level = level[1];
        } else {
          level = level[0];
        }
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
          _problemIndex = 1;
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
    return Column(
      children: [
        Text(
          answers.toString() + level,
        ),
        IndexedStack(
          index: _problemIndex,
          children: [
            SingleChoiceProblem(
              content: '你上一次通过的等级考试',
              choices: ['四级', '六级', '专四', '专八', '还没有通过等级考试'],
              callBack: getListAnswer,
            ),
            InputProblem(
              content: '你上一次等级考试的分数',
              callBack: getStringAnswer,
            ),
            SingleChoiceProblem(
              content: '您曾读完过多少英语原版书',
              choices: ['从未读完过', '读完过一本', '读完过两本及以上'],
              callBack: getListAnswer,
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
              callBack: getListStringAnswer,
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
              callBack: getListStringAnswer,
            ),
            Text('你的等级为：' + level),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                previousProblem();
              },
              child: Text('上一题'),
            ),
            ElevatedButton(
              onPressed: () {
                nextProblem();
              },
              child: Text('下一题'),
            ),
          ],
        ),
      ],
    );
  }
}
