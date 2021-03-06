import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:stemapp1/screens/score/material_screen.dart';

import '../models/Questions.dart';
import '../screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions;

  set questions(List<Question> questions) => _questions = questions;
  List<Question> get questions => this._questions;

  List<String> _materials = [];
  PDFDocument _document = new PDFDocument();
  set materials(List<String> pdfs) => _materials = pdfs;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  double _numOfCorrectAns = 0;
  double get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  // @override
  // void onClose() {
  //   super.onClose();
  //   _animationController.dispose();
  //   _pageController.dispose();
  // }

  Future<bool> clear() async {
    _animationController.reset();
    _animationController.dispose();
    _pageController.dispose();
    _questionNumber = 1.obs;
    _numOfCorrectAns = 0;
    Get.back();
    Get.back();

    return true;
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page

      if (_numOfCorrectAns / _questions.length < 0.5)
        _document = await PDFDocument.fromAsset(_materials[0]);
      else if (_numOfCorrectAns / _questions.length >= 0.5 &&
          _numOfCorrectAns / _questions.length < .8)
        _document = await PDFDocument.fromAsset(_materials[1]);

      Get.to(ScoreScreen(_document));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
