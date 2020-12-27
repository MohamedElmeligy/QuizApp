import 'package:flutter/material.dart';

import '../components/elevated_container.dart';

import './quiz_screen.dart';

class Topics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTopicsState();
}

class _MyTopicsState extends State<Topics> {
  List<String> topics = [
    "topic1",
    "topic2",
    "topic3",
    "topic5",
    "topic6",
    "topic7",
    "topic8",
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: topics.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.03),
            itemBuilder: (context, index) {
              return ElevatedContainer(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: sh * 0.1,
                  child: Center(child: Text(topics[index])),
                ),
              );
            },
          ),
          Positioned(
            bottom: 5,
            right: sw * 0.03,
            child: FlatButton(
              child: Text("Take Quiz"),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
