import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:stemapp1/models/Questions.dart';

class Lesson {
  String name;
  List<String> material;
  List<Question> quiz;
  
  Lesson({
    this.name,
    this.material,
    this.quiz,
  });
}
