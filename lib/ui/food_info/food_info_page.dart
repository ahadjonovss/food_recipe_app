import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:food_recipe_app/ui/food_info/widgets/info_item.dart';
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
          backgroundColor: Colors.red,
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
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverFillRemaining(
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
              InfoItem(title: "Category", info: food.category),
              InfoItem(title: "Category Label", info: food.categoryLabel),
              const SizedBox(height: 18,),
              Text("Ingredients:",style: GoogleFonts.arapey(fontWeight: FontWeight.w700,fontSize: 18),),
              const SizedBox(height: 18,),
              InfoItem(title: "ChocDf", info: "${food.nutrients.chocdf}"),
              InfoItem(title: "EnerCKal", info: food.nutrients.enercKcal.toString()),
              InfoItem(title: "Fat", info: "${food.nutrients.fat}"),
              InfoItem(title: "FibTg", info: "${food.nutrients.fibtg}"),
              InfoItem(title: "ProcNt", info: "${food.nutrients.procnt}"),
              InfoItem(title: "ProcNt", info: "${food.nutrients.procnt}"),
              InfoItem(title: "ProcNt", info: "${food.nutrients.procnt}"),
              const SizedBox(height: 16,),
              Text("About healthy diet",style: GoogleFonts.arapey(fontWeight: FontWeight.w700,fontSize: 18),),
              const SizedBox(height: 18,),
              Text("Your body needs a lot of discipline in terms of eating food regularly and at the proper times, which is why it’s essential to eat the right food at the right time. In the morning, food should be eaten within 30 minutes of waking up. Ideal time to have breakfast is between 7- 8am and have plenty of protein in your breakfast. For lunch, the ideal time is between 12:30pm and 1pm, and try to keep a gap of 4 hours between breakfast and lunch. For dinner, there is no ideal time but it should be eaten before 10pm. You should keep a good gap between your dinner and your sleep time as otherwise it will interfere with your sleep.",style: GoogleFonts.abel(),),


              // Text()
            ],
            ),
          ),
        )
      ],
    ));
  }
}
