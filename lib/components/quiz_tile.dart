import 'package:flutter/material.dart';

enum SingingCharacter { A, B, C, D }

class QuizTile extends StatefulWidget {
  const QuizTile({
    Key key,
    this.width = double.maxFinite,
    this.height,
    this.radius = 4.0,
    this.color = Colors.black12,
    this.fillColor = Colors.white,
    this.gradient,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.question,
    // @required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color fillColor;
  final Gradient gradient;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String question;

  @override
  _QuizTileState createState() => _QuizTileState();
}

class _QuizTileState extends State<QuizTile> {
  @override
  Widget build(BuildContext context) {
    SingingCharacter _character = SingingCharacter.A;
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.fillColor,
        gradient: widget.gradient,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0.0, 1.0),
            color: widget.color,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.question)),
          Container(
            height: 25,
            child: ListTile(
              title: const Text('First Option'),
              leading: Radio(
                value: SingingCharacter.A,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Container(
            height: 25,
            child: ListTile(
              title: const Text('Second Option'),
              leading: Radio(
                value: SingingCharacter.B,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Container(
            height: 25,
            child: ListTile(
              title: const Text('Third Option'),
              leading: Radio(
                value: SingingCharacter.C,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Container(
            height: 25,
            child: ListTile(
              title: const Text('Fourth Option'),
              leading: Radio(
                value: SingingCharacter.D,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
