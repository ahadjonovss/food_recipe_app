
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:food_recipe_app/ui/food_info/food_info_page.dart';
import 'package:food_recipe_app/ui/home/widgets/food_item.dart';
import 'package:food_recipe_app/utils/get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

   void initState() {
     scrollController.addListener(_scrollListener);
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    alignment: Alignment.center,
                    height: 48,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                        color: Colors.grey.withOpacity(0.2)),
                    child: const TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: Colors.grey.withOpacity(0.3)),
                  ),
                ],
              ),
              Text("Meals", style: GoogleFonts.lato(fontSize: 32)),
              BlocBuilder<HomePageBloc,HomePageState>(
                builder: (context, state) {
                  var currentBloc = context.read<HomePageBloc>();
                if(state is GettingMealsInSuccessState){
                  return SizedBox(
                    height: 900,
                    child: GridView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.foods.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 120,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) => FoodItem(food: state.foods[index].food),
                    ),
                  );
                }
                else if(state is GettingMealsInProgressState){
                  return const  CircularProgressIndicator();
                }
                else if(state is GettingMealsInFailuryState){
                  return Text(state.status);
                }else{
                  currentBloc.add(GetDefaultMeals());
                  return Container();
                }
              },)
            ],
          ),
        ),
      )
    );
  }

   void _scrollListener(){
     if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
       getIt<HomePageBloc>().add(GetDefaultMeals());
       print("New added");
     }
   }
}
