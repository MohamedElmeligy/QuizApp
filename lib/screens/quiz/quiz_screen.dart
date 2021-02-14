import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stemapp1/models/Questions.dart';

import '../../providers/question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  final List<Question> questions;
  QuizScreen(this.questions);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    _controller.questions = questions;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}
