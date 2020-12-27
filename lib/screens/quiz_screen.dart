import 'package:flutter/material.dart';

import '../components/elevated_container.dart';
import '../components/quiz_tile.dart';
import '../components/custom_dialog.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyQuizState();
}

class _MyQuizState extends State<Quiz> {
  List<String> quiz = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "Q5",
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: quiz.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.03),
            itemBuilder: (context, index) {
              return QuizTile(
                height: sh * 0.22,
                margin: EdgeInsets.symmetric(vertical: 10),
                question: quiz[index],
              );
            },
          ),
          Positioned(
            bottom: 5,
            right: sw * 0.03,
            child: FlatButton(
              child: Text("Submit"),
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (ctx) => CustomDialog(
                    title: "Quiz Result",
                    description: "Congrats! you have scored 8/10",
                    positiveButtonText: null,
                    negativeButtonText: "Okay",
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
