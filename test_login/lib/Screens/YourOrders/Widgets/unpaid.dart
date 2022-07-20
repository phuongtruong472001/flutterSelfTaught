import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/bills.dart';
import 'package:test_login/Screens/YourOrders/detail_order.dart';

import '../../../loaded.dart';

class Unpaid extends StatefulWidget {
  @override
  UnpaidPage createState() => UnpaidPage();
}

class UnpaidPage extends State<Unpaid> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ItemBills>(context);
    final startApp = Provider.of<StartApp>(context);

    if (startApp.isGetBill == false) {
      data.fetchBillItems();
      startApp.getBillComplete();
    }
    final listItems = data.bills;

    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            ItemBill item =
                ItemBill(id: "", name: "", quantity: 0, price: 0, image: "");
            //int i = 0;
            int total = 0;
            for (var element in listItems[index].items) {
              // print(element);

              item = ItemBill(
                  id: element["id"],
                  name: element["name"],
                  quantity: element["quantity"],
                  image: element["image"],
                  price: element["price"]);

              total += item.price * item.quantity;
            }
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailOrder(
                            itemBills: listItems[index].items,
                            Total: total,
                            address: listItems[index].address,
                            phone: listItems[index].phone,
                          ))),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: (Colors.black), width: 1),
                          ),
                          width: 50,
                          child: Image.network(item.image),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  item.name,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Text(listItems[index].items.length.toString() +
                                " items")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "ID Order",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(listItems[index].id,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
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
                              "Total Product",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(total.toString(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
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
                              "Status",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("Processing",
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
            );
          }),
    );
  }
}
