import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';

class FoodInfoPage extends StatelessWidget {
  Food food;
   FoodInfoPage({required this.food,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
