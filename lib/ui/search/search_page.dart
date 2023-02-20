import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:food_recipe_app/data/models/api_model/food_category.dart';
import 'package:food_recipe_app/data/models/api_model/food_health_type_model.dart';
import 'package:food_recipe_app/ui/search/widgets/nutrition_item.dart';
import 'package:food_recipe_app/utils/get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  String kCities = '';
  List choosens = [];

  void onTextFieldTap(context, List<SelectedListItem> data, String domain) {
    DropDownState(
      DropDown(
        bottomSheetTitle:  Text(
          kCities,
          style: const  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data:data,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              print("ADDED ${item.name}");
              getIt<HomePageBloc>().add(AddNutrientEvent(nutrient: "$domain${item.name}"));
              list.add(item.name);
            }
          }
          showSnackBar(list.toString(),context);
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message,context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${message.substring(1,message.length-1)} has been selected")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 400,
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/foods.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Positioned(
              top: 210,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 680,
                  width: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(52),topRight: Radius.circular(52)),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24,),
                      Text("Choose yourself!",style: GoogleFonts.akayaTelivigala(fontSize: 28),),
                      const SizedBox(height: 16,),
                      TextButton(onPressed: () {
                        onTextFieldTap(context,FoodHealth.getSelectedItems(),"&health=");

                      }, child: Text("Select healthy",style: GoogleFonts.alatsi(fontSize: 18),)),
                      const SizedBox(height: 16,),
                      TextButton(onPressed: () {
                        onTextFieldTap(context,FoodCategory.getSelectedItems(),"&category=");

                      }, child: Text("Select category",style: GoogleFonts.alatsi(fontSize: 18),)),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NutritionItem(title: "NIA"),
                          NutritionItem(title: "PROCNT"),
                          NutritionItem(title: "SUGAR"),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NutritionItem(title: "FIBTG"),
                          NutritionItem(title: "FOLFD"),
                          NutritionItem(title: "NA"),
                        ],
                      ),
                      const SizedBox(height: 60,),
                      ZoomTapAnimation(
                        onTap: () {
                          context.read<HomePageBloc>().add(SearchBySelectedEvent());
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 340,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child:  Text("Search!",style: GoogleFonts.akayaTelivigala(fontSize: 28,color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
