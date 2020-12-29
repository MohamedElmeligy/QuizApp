import 'package:flutter/material.dart';

class Interactive extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyInteractiveState();

}

class _MyInteractiveState extends State<Interactive>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("Interactive screen"),),
    );
  }

}