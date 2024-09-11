import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
          color1: Color.fromARGB(255, 23, 5, 64),
          color2: Color.fromARGB(255, 29, 4, 74)),
    ),
  ));
}
