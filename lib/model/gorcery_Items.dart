import 'category.dart';

class GorceryItems {
  final String id;
  final String name;
  final int quantity;
  final Category category;
  const GorceryItems({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
