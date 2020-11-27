import 'package:flutter/material.dart';

class YearClass extends StatefulWidget {
  final List<String> years;
  YearClass(this.years);
  @override
  State<StatefulWidget> createState() => YearClassState();
}

class YearClassState extends State<YearClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.years.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => YearClass(years)),
              // );
            },
            child: Container(
              height: 100,
              child: Card(
                color: Colors.grey,
                child: Text(widget.years[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
