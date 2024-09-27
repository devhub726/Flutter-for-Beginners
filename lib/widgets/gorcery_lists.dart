import 'package:flutter/material.dart';

import 'package:shopping_list_app/model/gorcery_Items.dart';
import 'package:shopping_list_app/widgets/new_item.dart';

class GorceryLists extends StatefulWidget {
  const GorceryLists({super.key});

  @override
  State<GorceryLists> createState() => _GorceryListsState();
}

class _GorceryListsState extends State<GorceryLists> {
  final List<GorceryItems> _gorceryItems = [];

  void _addItem() async {
    var newItem = await Navigator.of(context).push<GorceryItems>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _gorceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
        child: Text(
      "The [item] is currently unavailable in our inventory.!",
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    ));

    if (_gorceryItems.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: _gorceryItems.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  _gorceryItems[index].name,
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                leading: Container(
                  height: 25,
                  width: 25,
                  color: _gorceryItems[index].category.color,
                ),
                trailing: Text(
                  _gorceryItems[index].quantity.toString(),
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
              ),
            ],
          );
        },
      );
    }

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
      body: mainContent,
    );
  }
}
