import 'package:flutter/material.dart';
import 'package:my_app/BloC/drink.dart';


class ItemDrinkScreen extends StatelessWidget {
  Drink drink;

  ItemDrinkScreen(this.drink,{Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: <Widget>[
        Image.network(drink.imageUrl),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            width: double.infinity,
            color: Colors.black38,
            child: ListTile(
              title: Text(
                drink.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                '${drink.price} vnd',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: Icon(drink.isChoose ? Icons.check : Icons.add),
                onPressed: () {
                  
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
