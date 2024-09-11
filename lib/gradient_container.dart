import 'package:flutter/material.dart';
import 'package:flutter_for_feginners/dice_rolles.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.color1, required this.color2});

  const GradientContainer.deepPurple({super.key})
      : color1 = const Color.fromARGB(255, 23, 5, 64),
        color2 = const Color.fromARGB(255, 29, 4, 74);

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
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}
