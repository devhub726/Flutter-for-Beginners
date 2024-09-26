import 'package:flutter/material.dart';

import '../model/category.dart';

const categories = {
  Categories.vegetables: Category(
    title: "Vegetables",
    color: Colors.green,
  ),
  Categories.fruit: Category(
    title: "Fruit",
    color: Colors.orange,
  ),
  Categories.frozenFoods: Category(
    title: "FrozenFoods",
    color: Colors.grey,
  ),
  Categories.dairy: Category(
    title: "Dairy",
    color: Color.fromARGB(255, 108, 170, 221),
  ),
  Categories.carbs: Category(
    title: "Carbs",
    color: Colors.blue,
  ),
};
