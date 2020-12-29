import 'package:flutter/material.dart';

import '../components/elevated_container.dart';

import './concepts_screen.dart';
import './interactive_scree.dart';
import './quiz_screen.dart';

class YearClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => YearClassState();
}

class YearClassState extends State<YearClass> {
  final List<String> years = [
    "Education",
    "Interactive",
  ];

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lets get and A+ in statics"),
      ),
      body: ListView.builder(
        itemCount: years.length + 1,
        padding:
            EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.03),
        itemBuilder: (context, index) {
          return index != years.length
              ? GestureDetector(
                  onTap: () {
                    index == 0
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Topics()),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Interactive()),
                          );
                  },
                  child: ElevatedContainer(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: sh * 0.1,
                      child: Center(child: Text(years[index])),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz()),
                    );
                  },
                  child: ElevatedContainer(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: sh * 0.1,
                      child: Center(child: Text("Take Quiz")),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
