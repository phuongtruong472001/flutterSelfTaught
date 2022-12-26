import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';
import 'package:test_login/Models/product.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {
  final cart = <Product>[];

  Future<List<Product>> loadDataFromAPI() => Future.delayed(_delay, () async {
        Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
        String url = API().api_product;
        List<Product> products = [];
        try {
          // EasyLoading.show(status: "Đang lấy thông tin ");
          final response = await http.get(Uri.parse(url), headers: headers);
          final listproducts =
              convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
          for (var element in listproducts) {
            products.add(Product.fromJson(element));
          }
          print("size:${products.length}");
        } catch (error) {
          print("lỗi rồi");
        }
        return products;
      });

  Future<List<Product>> loadCartproducts() async {
    return Future.delayed(_delay, () => cart);
  }

  Future<List<Product>> loadListproducts() async {
    List<Product> products = await loadDataFromAPI();
    return Future.delayed(_delay, () => products);
  }

  void addproductToCart(Product product) => cart.add(product);
  void increaseQuantity(Product product) {
    final index = cart.indexWhere((element) => element.id == product.id);
    
    cart[index].quantity++;
  }

  void removeproductFromCart(Product product) => cart.remove(product);
}
