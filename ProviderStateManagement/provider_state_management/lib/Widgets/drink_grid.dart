import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/drinks.dart';
import 'package:provider_state_management/Widgets/item_drink_ui.dart';

class DrinkGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drinksData = Provider.of<Drinks>(context);
    final drinks = drinksData.drinks;
    return GridView.builder(
      itemCount: drinks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: drinks[index],
        child: ItemDrinkScreen(),
      ),
    );
  }
}
