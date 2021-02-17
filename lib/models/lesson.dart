import 'package:stemapp1/models/Questions.dart';

class Lesson {
  String name;
  List material;
  List<Question> quiz;
  
  Lesson({
    this.name,
    this.material,
    this.quiz,
  });
}
