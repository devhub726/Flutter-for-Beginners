import 'category.dart';

class GroceryItems {
  final String id;
  final String name;
  final int quantity;
  final Category category;
  const GroceryItems({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
