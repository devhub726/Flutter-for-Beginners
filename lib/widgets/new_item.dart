import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  void _saveItem() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey[700],
        title: Text(
          "Add new item",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  counterStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          "Quantity",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                      ),
                      initialValue: "1",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid, positive number.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      style: const TextStyle(color: Color(0xff426b6f)),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      dropdownColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      elevation: 0,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey[700],
                      ),
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  category.value.title,
                                )
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                },
                child: const Text("Reset"),
              ),
              GestureDetector(
                onTap: _saveItem,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Add Item",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
