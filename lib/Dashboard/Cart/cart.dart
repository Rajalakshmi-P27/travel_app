import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Dashboard/Cart/cartproviders.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cartproviders>(context).cartlist;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Item"),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final dummydata = data[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    dummydata["imageurl"]!,
                  ),
                  radius: MediaQuery.of(context).size.width * 0.08,
                ),
                title: Text(
                  dummydata['name']?.toString() ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${dummydata['price']?.toString() ?? ""}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete"),
                              content: Text("Are you sure you want to delete"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Provider.of<Cartproviders>(context,
                                              listen: false)
                                          .removeProduct(
                                              dummydata); // Need to perform remove function cartprovider file using provider..
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Yes")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No"))
                              ],
                            );
                          });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            }));
  }
}
