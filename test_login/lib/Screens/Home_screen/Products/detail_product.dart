import 'package:flutter/material.dart';
import 'package:test_login/Models/product.dart';

class DetailProduct extends StatefulWidget {
  Product product;
  DetailProduct({Key? key, required this.product}) : super(key: key);
  @override
  DetailProductPage createState() => DetailProductPage();
}

class DetailProductPage extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 196, 205),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      child: IconButton(
                          onPressed: () {
                            widget.product.checkFavorite = !widget.product.checkFavorite;
                            print(widget.product.checkFavorite);
                          },
                          icon: widget.product.checkFavorite
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                      alignment: Alignment.centerRight,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(widget.product.toString()),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                child: Image.network(
                  widget.product.imageLink,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.45,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 163, 147, 147),
                    border: Border.all(color: (Colors.black), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                       widget. product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "\$ " + widget.product.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(),
                      ),
                      Text("Số lượng còn lại trong kho : " +
                          widget.product.quantity.toString()),
                      Text("Đã bán : " + widget.product.sold.toString()),
                      Text(widget.product.description)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                )),
                                width: 20,
                                child: const Center(child: Text("1")),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: (Colors.black), width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          height: 50,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
