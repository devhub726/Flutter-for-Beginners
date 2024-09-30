import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/grocery_items.dart';
import 'package:shopping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryLists extends StatefulWidget {
  const GroceryLists({super.key});

  @override
  State<GroceryLists> createState() => _GorceryListsState();
}

class _GorceryListsState extends State<GroceryLists> {
  List<GroceryItems> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        "flutter-prep-19c3b-default-rtdb.firebaseio.com", "shopping-list.json");
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      setState(() {
        _error = "Failed to fatch data. Please try again later";
      });
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    print(listData);
    final List<GroceryItems> loadedItems = [];

    for (final gorceryItems in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == gorceryItems.value["category"],
          )
          .value;
      loadedItems.add(
        GroceryItems(
          id: gorceryItems.key,
          name: gorceryItems.value["name"],
          quantity: gorceryItems.value["quentity"],
          category: category,
        ),
      );
    }
    setState(() {
      _groceryItems = loadedItems;
      _isLoading = false;
    });
  }

  void _addItem() async {
    final gorceryItems = await Navigator.of(context).push<GroceryItems>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (gorceryItems == null) {
      return;
    }

    setState(() {
      _groceryItems.add(gorceryItems);
    });
  }

  void _removeItem(GroceryItems groceryItem) async {
    final gorceryIndex = _groceryItems.indexOf(groceryItem);
    var isDalete = true;
    setState(() {
      _groceryItems.remove(groceryItem);
    });
    if (!mounted) {
      return;
    }

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
            isDalete = false;
            setState(() {
              _groceryItems.insert(gorceryIndex, groceryItem);
            });
          },
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 3));
    print(isDalete);
    if (isDalete) {
      final url = Uri.https("flutter-prep-19c3b-default-rtdb.firebaseio.com",
          "shopping-list/${groceryItem.id}.json");
      var response = await http.delete(url);

      if (response.statusCode >= 400) {
        setState(() {
          _groceryItems.insert(gorceryIndex, groceryItem);
        });
      }
    }
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

    if (_isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(_groceryItems[index].id),
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
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
                  _groceryItems[index].name,
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                leading: Container(
                  height: 25,
                  width: 25,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(
                  _groceryItems[index].quantity.toString(),
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
              ),
            ),
          );
        },
      );
    }

    if (_error != null) {
      mainContent = Center(
          child: Text(
        _error!,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ));
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
