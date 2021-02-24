import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

import 'package:stemapp1/models/Questions.dart';
import 'package:stemapp1/models/lesson.dart';
import 'package:stemapp1/models/level.dart';

class Subject {
  String name;
  List<Level> levels;
  Subject({
    this.name,
    this.levels,
  });
}

PDFDocument pdf, pdf1, pdf2;

Future<void> init() async {
  pdf = await PDFDocument.fromAsset('assets/pdfs/test.pdf');
  pdf1 = await PDFDocument.fromAsset('assets/pdfs/test.pdf');
  pdf2 = await PDFDocument.fromAsset('assets/pdfs/test.pdf');
}

List<Subject> subjects_data = [
  Subject(
    name: "Chemistry",
    levels: [
      Level(
        level: "Grade 10",
        lessons: [
          Lesson(
            name: "Elements and Atom",
            material: [pdf, pdf1, pdf2],
            quiz: [
              Question(
                id: 1,
                question:
                    "By knowing the number of protons a neutral atom has, you should be able to determine",
                answer: 2,
                options: [
                  "the number of neutrons in the neutral atom",
                  "the number of electrons in the neutral atom",
                  "the name of the atom",
                  "two of the above",
                  "none of the above",
                ],
              ),
              Question(
                id: 2,
                question: "Which of the following statements is true?",
                answer: 1,
                options: [
                  "Ions are formed by adding or removing protons or electrons.",
                  "Scientists believe that solids are mostly open space.",
                  "Heating water with a Bunsen burner results in a 2:1 mixture of hydrogen and oxygen gases.",
                  "At least two of the above statements (A-C) are true.",
                  "All of the statements (A-C) are false",
                ],
              ),
              Question(
                id: 3,
                question:
                    "The number of electrons in an atom is the same for all neutral atoms of that element.",
                answer: 0,
                options: [
                  "true",
                  "false",
                ],
              ),
              Question(
                id: 4,
                question: "A species with 12 protons and 10 electrons is",
                answer: 2,
                options: [
                  "Ne2+",
                  "Ti2+",
                  "Mg2+",
                  "Mg",
                  "Ne2–",
                ],
              ),
              Question(
                id: 5,
                question:
                    "The numbers of protons, neutrons, and electrons in K+ are:",
                answer: 4,
                options: [
                  "20 p, 19 n, 19 e",
                  "20 p, 19 n, 20 e",
                  "19 p, 20 n, 20 e",
                  "19 p, 20 n, 19 e",
                  "19 p, 20 n, 18 e",
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
