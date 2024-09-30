import '../model/category.dart';
import '../model/grocery_items.dart';
import 'categories.dart';

final groceryItems = [
  GroceryItems(
    id: "a",
    name: "Milk",
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryItems(
    id: "b",
    name: "Bananas",
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  GroceryItems(
    id: "c",
    name: "ice cream",
    quantity: 1,
    category: categories[Categories.frozenFoods]!,
  ),
];
