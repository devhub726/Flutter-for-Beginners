import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.color1, required this.color2});

  GradientContainer.deepPurple({super.key})
      : color1 = const Color.fromARGB(255, 23, 5, 64),
        color2 = const Color.fromARGB(255, 29, 4, 74);

  final Color color1;
  final Color color2;
  var activeDiceImage = "assets/images/dice/dice-1.png";
  void rollDice() {
    activeDiceImage = "assets/images/dice/dice-4.png";
    print("Changing image...");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1, color2],
        begin: startAlignment,
        end: endAlignment,
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 201,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                  // padding: const EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
              child: const Text("Roll Dice"),
            ),
          ],
        ),
      ),
    );
  }
}
