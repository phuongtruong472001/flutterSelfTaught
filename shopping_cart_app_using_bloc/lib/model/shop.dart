
class ShopItem {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isChoose;
  int quantity;

 ShopItem({ required this.id, required this.title, required this.price, required this.imageUrl,this.isChoose=false,this.quantity=0});
}
