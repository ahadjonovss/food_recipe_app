import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:food_recipe_app/ui/food_info/food_info_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FoodItem extends StatelessWidget {
  Food food;
   FoodItem({required this.food,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodInfoPage(food: food),));

      },
      child: CachedNetworkImage(
        imageUrl: food.image,
        imageBuilder: (context, imageProvider) => Container(
          alignment: Alignment.bottomCenter,
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              image:  DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue),
          child: Text(
            food.knownAs,
            maxLines: 2,
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        placeholder: (context, url) => Lottie.asset('assets/food_loading.json'),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}


