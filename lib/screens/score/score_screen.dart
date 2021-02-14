import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import './material_screen.dart';

import '../../constants.dart';
import '../../providers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  final PDFDocument _material;
  ScoreScreen(this._material);
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return _qnController.clear();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            Column(
              children: [
                Spacer(flex: 3),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kSecondaryColor),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kSecondaryColor),
                ),
                SizedBox(height: 50),
                FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Get.to(MaterialScreen(_material));
                  },
                  child: Text("improve your score with this material"),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
