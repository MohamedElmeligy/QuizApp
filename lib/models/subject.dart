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

List<Subject> subjectsData = [
  Subject(
    name: "Chemistry",
    levels: [
      Level(
        level: "Grade 10",
        lessons: [
          Lesson(
            name: "Elements and Atom",
            material: [
              'assets/pdfs/zeroToFour.pdf',
              'assets/pdfs/fiveToSeven.pdf',
            ],
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
              Question(
                id: 6,
                question: "An ion is formed",
                answer: 1,
                options: [
                  "By either adding or subtracting protons from the atom",
                  "By either adding or subtracting electrons from the atom ",
                  "By either adding or subtracting neutrons from the atom",
                  "All of the above are true",
                  "None of the above is true",
                ],
              ),
              Question(
                id: 7,
                question: "All of the following are true except:",
                answer: 1,
                options: [
                  "Ions are formed by adding electrons to a neutral atom",
                  "Ions are formed by changing the number of protons in an atom's nucleus",
                  "Ions are formed by removing electrons from a neutral atom",
                  "An ion has a positive or negative charge",
                  "Metals tend to form positive ions",
                ],
              ),
              Question(
                id: 8,
                question: "The formula of water, H2O, suggests:",
                answer: 1,
                options: [
                  "There is twice as much mass of hydrogen as oxygen in each molecule",
                  "There are two hydrogen atoms and one oxygen atom per water molecule",
                  "There is twice as much mass of oxygen as hydrogen in each molecule",
                  "There are two oxygen atoms and one hydrogen atom per water molecule",
                  "None of these",
                ],
              ),
              Question(
                id: 9,
                question: "The nucleons are",
                answer: 2,
                options: [
                  "Protons and electrons",
                  "Protons and electrons",
                  "Protons and neutrons",
                  "None of these",
                ],
              ),
              Question(
                id: 10,
                question: "The isotope deuterium of hydrogen has",
                answer: 3,
                options: [
                  "No neutrons and one proton",
                  "One neutron and two protons",
                  "One electron and two neutrons",
                  "One proton and one neutron",
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
