
class Drink {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isChoose;
  int quantity;

  Drink({required this.id,required this.title,required this.price,required this.imageUrl,this.isChoose=false,this.quantity=0});

 
}
class Drinks {
  List<Drink> shopitems;

  Drinks({required this.shopitems});

  void addProduct(Drink p) {
    shopitems.add(p);
  }

  void removeProduct(Drink p) {
    shopitems.add(p);
  }
}
