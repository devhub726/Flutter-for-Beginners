import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key, required this.color1, required this.color2});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1, color2],
        begin: startAlignment,
        end: endAlignment,
      )),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset("assets/images/dice/dice-1.png",width: 201,),
      )),
    );
  }
}
