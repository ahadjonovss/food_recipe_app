import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodInfoPage extends StatelessWidget {
  Food food;
  FoodInfoPage({required this.food, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(food.image),
          ),
          title:  Text(
            food.knownAs,
            style:
            GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 20)),
          centerTitle: true,
          pinned: true,
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(height: 12,),
            Text(
              food.knownAs,
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 20),
            ),
              const SizedBox(height: 16,),
              Text("About healthy diet",style: GoogleFonts.arapey(fontWeight: FontWeight.w700,fontSize: 18),),
              const SizedBox(height: 18,),
              Text("A healthy diet is something that needs to be followed by almost everyone, and helps you in leading a good and nutritious life. Many people know what to eat, but they do not have an idea on when to eat it. And that is a very big problem, as people need to have a fair idea of when to eat. Even if you eat the healthiest food but at the wrong time, all the healthy food that you ate will lose its value.",
            style: GoogleFonts.abel(),),
              const SizedBox(height: 18,),
              Text("About this food",style: GoogleFonts.arapey(fontWeight: FontWeight.w700,fontSize: 18),),
              const SizedBox(height: 18,),

              // Text()
            ],
          ),
          ),
        )
      ],
    ));
  }
}
