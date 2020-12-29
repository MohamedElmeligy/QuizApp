import 'package:flutter/material.dart';

import '../components/elevated_container.dart';
import 'options_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> subjects = [
    "Chapter 1",
    "Chapter 2",
    "Chapter 3",
    "Chapter 4",
    "Chapter 5",
    "Chapter 6",
    "Chapter 7",
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizes APP"),
      ),
      body: GridView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.03),
        itemCount: subjects.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearClass()),
              );
            },
            child: ElevatedContainer(
              child: Center(child: Text(subjects[index])),
              fillColor: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
