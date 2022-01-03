
class InforClothes {
  late String name;
  late String img;
  late String oldPrice;
  late String newPrice;
  InforClothes(this.name,this.img,this.oldPrice,this.newPrice);
 
}
 
  List<InforClothes> listNewest=[
      InforClothes("Red Dress", "products/dress/dress_1.jpeg", "\$16", "\$15"),
      InforClothes("Vamsi", "products/dress/dress_2.jpeg", "\$29", "\$28"),
      InforClothes("Idal", "products/dress/dress_3.jpeg", "\$16", "\$15"),
      InforClothes("Red Dress", "products/dress/dress_6.jpeg", "\$16", "\$15")
    ];
  List<InforClothes> listFeatrured=[
      InforClothes("Red Dress", "products/bag_brwon.jpeg", "\$16", "\$15"),
      InforClothes("Vamsi", "products/shoes.jpeg", "\$29", "\$28"),
      InforClothes("Idal", "products/spects.jpg", "\$16", "\$15"),
      InforClothes("Red Dress", "products/watch_1.jpg", "\$16", "\$15")
    ];
