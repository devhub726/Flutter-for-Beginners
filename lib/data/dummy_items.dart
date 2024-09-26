import '../model/category.dart';
import '../model/gorcery_Items.dart';
import 'categories.dart';

final gorceryItems = [
  GorceryItems(
    id: "a",
    name: "Milk",
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GorceryItems(
    id: "b",
    name: "Bananas",
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  GorceryItems(
    id: "c",
    name: "ice cream",
    quantity: 1,
    category: categories[Categories.frozenFoods]!,
  ),
];
