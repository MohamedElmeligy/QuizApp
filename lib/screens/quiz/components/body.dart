import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../providers/question_controller.dart';
import '../../../models/Questions.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
    
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: sh * 0.14,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: ProgressBar(),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Obx(
                        () => Text.rich(
                          TextSpan(
                            text:
                                "Question ${_questionController.questionNumber.value}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text:
                                    "/${_questionController.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(thickness: 1.5),
                  ],
                ),
              ),
              Container(
                height: sh * 0.73,
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
