import 'package:appcart/cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final products = List<String>.generate(30, (i) {
    return 'Product No $i';
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(products, (index) {
        selecteditem.add(products[index]);
      }),
    );
  }
}

List<String> selecteditem = [];

class ProductList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final products;
  // ignore: use_key_in_widget_constructors
  const ProductList(this.products, this.onShow);
  final ValueSetter<int> onShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text(
            "Product List",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          backgroundColor: Colors.yellow,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(selecteditem),
                      ));
                }),
          ],
          // leading: IconButton(
          //     icon: const Icon(Icons.arrow_forward),
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => Cart(selecteditem),
          //           ));
          //     }),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: const Text(
                'PrductList',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onShow(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Product No $index is Added",
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ));
              },
            );
          },
          itemCount: products.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black,
              thickness: 10,
            );
          },
        ));
  }
}
