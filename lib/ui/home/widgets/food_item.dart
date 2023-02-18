import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItem extends StatelessWidget {
  Food food;
   FoodItem({required this.food,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: NetworkImage(
                  food.image),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue),
      child: Text(
        food.knownAs,
        maxLines: 2,
        style: GoogleFonts.lato(
            color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
