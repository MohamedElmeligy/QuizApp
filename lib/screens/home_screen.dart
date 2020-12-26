import 'package:flutter/material.dart';
import 'level_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> subjects = [
    "Physics1",
    "Physics2",
    "Physics3",
    "Physics4",
    "Physics5",
    "Physics6",
  ];

  List<String> years = [
    "Grade 10",
    "Grade 11",
    "Grade 12",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizes APP"),
      ),
      body: GridView.builder(
        itemCount: subjects.length,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearClass(years)),
              );
            },
            child: Card(
              color: Colors.grey,
              child: Text(subjects[index]),
            ),
          );
        },
      ),
    );
  }
}
