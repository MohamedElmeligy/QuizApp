import 'package:flutter/material.dart';

import 'package:websafe_svg/websafe_svg.dart';

import '../components/elevated_container.dart';
import '../models/lesson.dart';

import './quiz/quiz_screen.dart';

class Topics extends StatefulWidget {
  final List<Lesson> lessons;
  Topics(this.lessons);

  @override
  State<StatefulWidget> createState() => _MyTopicsState();
}

class _MyTopicsState extends State<Topics> {
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
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          ListView.builder(
            itemCount: widget.lessons.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.03),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuizScreen(widget.lessons[index].quiz),
                    ),
                  );
                },
                child: ElevatedContainer(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: sh * 0.1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Text(widget.lessons[index].name),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/icons/Quiz_icon.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(widget.lessons[0].quiz),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
