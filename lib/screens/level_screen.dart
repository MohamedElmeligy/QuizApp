import 'package:flutter/material.dart';

import 'package:websafe_svg/websafe_svg.dart';

import '../models/subject.dart' as subjects;
import '../components/elevated_container.dart';
import './topics_screen.dart';

class YearClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => YearClassState();
}

class YearClassState extends State<YearClass> {
  final List<String> years = [
    "Grade 10",
    "Grade 11",
    "Grade 12",
  ];

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn and Train"),
      ),
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          ListView.builder(
            itemCount: years.length,
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.03),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Topics(subjects.subjects_data[0].levels[0].lessons),
                      ),
                    );
                  if (index == 1)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Topics(subjects.subjects_data[0].levels[0].lessons),
                      ),
                    );
                  if (index == 2)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Topics(subjects.subjects_data[0].levels[0].lessons),
                      ),
                    );
                },
                child: ElevatedContainer(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: sh * 0.1,
                    child: Center(child: Text(years[index])),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
