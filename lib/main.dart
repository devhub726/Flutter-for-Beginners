import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GradientContainer(
          color1: const Color.fromARGB(255, 23, 5, 64),
          color2: const Color.fromARGB(255, 29, 4, 74)),
    ),
  ));
}
