import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selecteditem;
  // ignore: use_key_in_widget_constructors
  const Cart(this.selecteditem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Cart Item",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: selecteditem.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            selecteditem[index],
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
