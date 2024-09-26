import 'package:flutter/material.dart';

import '../model/category.dart';

const categories = {
  Categories.vegetables: Category(
    title: "Vegetables",
    color: Color.fromARGB(255, 44, 116, 47),
  ),
  Categories.fruit: Category(
    title: "Fruit",
    color: Color.fromARGB(255, 78, 228, 9),
  ),
  Categories.frozenFoods: Category(
    title: "FrozenFoods",
    color: Colors.grey,
  ),
  Categories.dairy: Category(
    title: "Dairy",
    color: Color.fromARGB(255, 108, 176, 216),
  ),
  Categories.carbs: Category(
    title: "Carbs",
    color: Color.fromARGB(255, 4, 66, 117),
  ),
  Categories.sweets: Category(
    title: "Sweets",
    color: Color.fromARGB(255, 236, 142, 1),
  ),
  Categories.spices: Category(
    title: "Spices",
    color: Color.fromARGB(255, 224, 173, 3),
  ),
  Categories.convenience: Category(
    title: "Convenience",
    color: Color.fromARGB(255, 87, 14, 221),
  ),
  Categories.hygiene: Category(
    title: "Hygiene",
    color: Color.fromARGB(255, 79, 2, 179),
  ),
  Categories.other: Category(
    title: "Other",
    color: Colors.blue,
  ),
};
