import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websafe_svg/websafe_svg.dart';

import '../components/elevated_container.dart';
import './level_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> subjects = [
    "Chemistry",
    "Physics",
    "Geology",
    "Biology",
    "Mathematics",
    "Mechanics",
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ST Guide"),
      ),
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.03),
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
                  Get.to(YearClass());
                },
                child: ElevatedContainer(
                  child: Center(child: Text(subjects[index],style: TextStyle(fontSize: 14),)),
                  fillColor: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
