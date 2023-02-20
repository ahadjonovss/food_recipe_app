import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NutritionItem extends StatefulWidget {
  String title;
   NutritionItem({required this.title,Key? key}) : super(key: key);

  @override
  State<NutritionItem> createState() => _NutritionItemState();
}

class _NutritionItemState extends State<NutritionItem> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc,HomePageState>(
      listener: (context, state) {
        if(state is CollectAllSelectedState){
          context.read<HomePageBloc>().add(AddNutrientEvent(nutrient: "&nutrients%5B${widget.title}%5D=$amount"));
        }
      },
      child: SizedBox(
        height: 100,
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(amount.toString(),style: GoogleFonts.alatsi(fontSize: 20),),
            Text(widget.title,style: GoogleFonts.alatsi(fontSize: 24,color: Colors.redAccent),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    amount-=10;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange
                    ),
                    child: const Icon(Icons.remove,color: Colors.white,),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    amount+=10;
                    setState(() {});
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange
                    ),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )
    ;
  }
}
