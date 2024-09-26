import 'package:flutter/material.dart';

import 'package:shopping_list_app/data/dummy_items.dart';

class GorceryLists extends StatelessWidget {
  const GorceryLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Gorceries",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: ListView.builder(
        itemCount: gorceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              gorceryItems[index].name,
              style: TextStyle(color: Colors.grey[700], fontSize: 18),
            ),
            leading: Container(
              height: 25,
              width: 25,
              color: gorceryItems[index].category.color,
            ),
            trailing: Text(
              gorceryItems[index].quantity.toString(),
              style: TextStyle(color: Colors.grey[700], fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
