import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/gorcery_Items.dart';
import 'package:shopping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GorceryLists extends StatefulWidget {
  const GorceryLists({super.key});

  @override
  State<GorceryLists> createState() => _GorceryListsState();
}

class _GorceryListsState extends State<GorceryLists> {
  List<GorceryItems> _gorceryItems = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        "flutter-prep-19c3b-default-rtdb.firebaseio.com", "shopping-list.json");
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    print(listData);
    final List<GorceryItems> loadedItems = [];

    for (final gorceryItems in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == gorceryItems.value["category"],
          )
          .value;
      loadedItems.add(
        GorceryItems(
          id: gorceryItems.key,
          name: gorceryItems.value["name"],
          quantity: gorceryItems.value["quentity"],
          category: category,
        ),
      );
    }
    setState(() {
      _gorceryItems = loadedItems;
    });
  }

  void _addItem() async {
    final gorceryItems = await Navigator.of(context).push<GorceryItems>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (gorceryItems == null) {
      return;
    }

    setState(() {
      _gorceryItems.add(gorceryItems);
    });
  }

  void _removeIetm(GorceryItems gorceryItem) {
    final gorceryIndex = _gorceryItems.indexOf(gorceryItem);

    setState(() {
      _gorceryItems.remove(gorceryItem);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Gorcery deleted.",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _gorceryItems.insert(gorceryIndex, gorceryItem);
            });
          },
        ),
      ),
    );
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
          return Dismissible(
            key: ValueKey(_gorceryItems[index].id),
            onDismissed: (direction) {
              _removeIetm(_gorceryItems[index]);
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 13.5),
              color: Theme.of(context).colorScheme.secondary,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.delete_sweep_outlined,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.secondary,
              shape: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shadowColor: Theme.of(context).colorScheme.primary,
              child: ListTile(
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
            ),
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
