import 'package:flutter/material.dart';

import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/widgets/new_item.dart';

class GorceryLists extends StatefulWidget {
  const GorceryLists({super.key});

  @override
  State<GorceryLists> createState() => _GorceryListsState();
}

class _GorceryListsState extends State<GorceryLists> {
  void _addItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Your Gorceries",
          style: TextStyle(color: Colors.grey[700]),
        ),
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(
              Icons.add,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: gorceryItems.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
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
              ),
              // Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Theme.of(context).colorScheme.secondary,
              // )
            ],
          );
        },
      ),
    );
  }
}
