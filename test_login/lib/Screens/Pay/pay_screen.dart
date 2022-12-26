import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';
import 'package:test_login/Screens/Cart_screen/cart_screen.dart';
import 'package:test_login/Screens/Profile/edit_address.dart';
import 'package:test_login/Screens/YourOrders/your_orders.dart';

import '../../Models/bills.dart';

class PayScreen extends StatefulWidget {
  @override
  PayScreenPage createState() => PayScreenPage();
}

class PayScreenPage extends State<PayScreen> {
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> createArea(
      List<ItemBill> items, String phone, String address) async {
    String url = API().api_bill;

    try {
      //String phone = box.read("phone")??"";
      String body = '{"address":"$address","phone":"$phone","product": [';
      for (int i = 0; i < items.length; i++) {
        String image = items[i].image;
        String id = items[i].id;
        String name = items[i].name;
        int price = items[i].price;
        int quantity = items[i].quantity;
        if (i < items.length - 1) {
          body +=
              '{"image": "$image","id": "$id","name": "$name","quantity": $quantity,"price": $price},';
        } else {
          body +=
              '{"image": "$image","id": "$id","name": "$name","quantity": $quantity,"price": $price}';
        }
      }

      body += ']}';
      print(body);
      final response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-type": "application/json"});
      print(response.body);
      if (response.statusCode == 201) {
        print("Đặt hàng thành công");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = [];
    String address = box.read("address") ;
    String phone = box.read("phone") ;
    String username = box.read("username") ;

    final snackBar = SnackBar(
      content: const Text('Order completed !'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Center(
                      child: Text(
                        "Confirm Bill",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 195, 207, 213))),
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Delivery Address",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangeAddress()));
                                },
                                child: const Text("Change",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text("Home"),
                  SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.phone, color: Colors.orange),
                          title: Text(phone),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.person, color: Colors.orange),
                          title: Text(username),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeAddress()));
                            },
                            icon: const Icon(Icons.navigate_next_outlined),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.orange,
                          ),
                          title: Text(address),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 195, 207, 213))),
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Bill",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 4,
                          child: Text(
                            "Product",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                                "items",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.navigate_next_rounded),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()));
                              },
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Price",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Shipping Fee",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("\$2",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Have a promo code?",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("Change",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Total bill",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 400,
                child: CupertinoButton(
                    color: const Color.fromARGB(255, 224, 140, 80),
                    disabledColor: const Color.fromARGB(255, 214, 155, 53),
                    borderRadius: BorderRadius.circular(30),
                    onPressed: () async {
                      // List<ItemBill> list = [];
                      // for (var item in cartItems.products.values) {
                      //   list.add(ItemBill(
                      //       id: item.id,
                      //       name: item.name,
                      //       quantity: item.quantity,
                      //       image: item.imageLink,
                      //       price: item.price));
                      // }
                      // createArea(list, phone, address);
                      // cartItems.clear();

                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => YourOrders()));
                    },
                    child: const Text(
                      "Complete",
                      style: TextStyle(
                          fontSize: 15,
                          //color: Colors.black,
                          decoration: TextDecoration.none),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
