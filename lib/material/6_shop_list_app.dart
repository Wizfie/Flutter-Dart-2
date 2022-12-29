import 'package:flutter/material.dart';

// class _Product {
//   _Product({required this.name, required this.qty});
//   String name;
//   int qty;
//   bool inCart = false;

//   int firstqty = 0;

//   void decrement() {
//     firstqty += 1;
//     if (this.qty != 0) {
//       this.qty -= 1;
//     } else {
//       this.qty = firstqty - 1;
//       this.firstqty = 0;
//     }
//     this.inCart = (qty == 0) ? true : false;
//   }
// }

// List<_Product> productData = [
//   _Product(name: "Telur", qty: 3),
//   _Product(name: "Gula", qty: 2),
//   _Product(name: "Tepung", qty: 2)
// ];

class ShopListApp extends StatelessWidget {
  const ShopListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop List App',
      home: Scaffold(
        appBar: AppBar(title: Text("Shopping List")),
        body: _ProductList(),
      ),
    );
  }
}

class Item {
  String Itemname;
  int ItemQty;

  Item({required this.Itemname, required this.ItemQty});
}

class _ProductList extends StatefulWidget {
  const _ProductList({super.key});

  @override
  State<_ProductList> createState() => __ProductListState();
}

class __ProductListState extends State<_ProductList> {
  final ItemController = TextEditingController();
  final QtyController = TextEditingController();

  List<Item> itemData = [
    Item(Itemname: "Kecap", ItemQty: 4),
    Item(Itemname: "Saos", ItemQty: 5),
    Item(Itemname: "Mie", ItemQty: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                "${itemData[index].Itemname} x ${itemData[index].ItemQty}"),
            leading: CircleAvatar(
              child: Text("@"),
              backgroundColor:
                  (itemData[index].ItemQty != 0) ? Colors.blue : Colors.red,
            ),
            onTap: (itemData[index].ItemQty) != 0
                ? () {
                    setState(() {
                      itemData[index].ItemQty = itemData[index].ItemQty - 1;
                    });
                  }
                : null,
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    itemData.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                // ignore: prefer_const_constructors
                return AlertDialog(
                  scrollable: true,
                  // ignore: prefer_const_constructors
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nama",
                            icon: Icon(Icons.add_shopping_cart),
                          ),
                          controller: ItemController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Qty",
                            icon: Icon(Icons.add),
                          ),
                          controller: QtyController,
                        )
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        child: Text("add"),
                        onPressed: () {
                          setState(() {
                            itemData.add(Item(
                                Itemname: ItemController.text,
                                ItemQty: int.parse(QtyController.text)));
                            ItemController.clear();
                            QtyController.clear();
                          });
                        })
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}







// class _ProductList extends StatefulWidget {
//   _ProductList({super.key});

//   @override
//   State<_ProductList> createState() => __ProductListState();
// }

// class __ProductListState extends State<_ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: productData.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//           onTap: () {
//             setState(() {
//               productData[index].decrement();
//             });
//           },
//           leading: CircleAvatar(
//             backgroundColor:
//                 productData[index].inCart ? Colors.grey : Colors.amber,
//             radius: 30,
//             child: Text(
//               productData[index].name[0],
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             ),
//           ),
//           title: Text(
//             "${productData[index].name} x${productData[index].qty}",
//             style: productData[index].inCart
//                 ? TextStyle(
//                     color: Colors.black38,
//                     fontSize: 24,
//                     decoration: TextDecoration.lineThrough)
//                 : TextStyle(
//                     fontSize: 24,
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
