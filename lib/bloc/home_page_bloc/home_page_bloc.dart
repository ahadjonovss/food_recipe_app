import 'package:bloc/bloc.dart';
import 'package:food_recipe_app/data/models/food_detailed/food_detailed.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:food_recipe_app/data/models/my_response.dart';
import 'package:food_recipe_app/service/api_service/api_service.dart';
import 'package:food_recipe_app/utils/get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<GetDefaultMeals>(getDefaultMeals);
    on<SearchMealsEvent>(searchMeal);
    on<AddNutrientEvent>(addNutrients);
    on<SearchBySelectedEvent>(searchBySelected);
  }

  List<Hint> meals=[];

  List nutrients = [];


  getDefaultMeals(GetDefaultMeals event, emit) async {
    emit(GettingMealsInProgressState());
    MyResponse myResponse = await getIt<ApiService>().getDefaultMeals();
    if(myResponse.error.isEmpty){
      meals.addAll(myResponse.data!.hints);
      emit(GettingMealsInSuccessState(foods: meals));
    }else{
      emit(GettingMealsInFailuryState(status: myResponse.error));
    }
  }

  searchMeal(SearchMealsEvent event, emit) async {
    emit(GettingMealsInProgressState());
    List<FoodDetailedModel> foods = await getIt<ApiService>().getMealByName(event.name);
    emit(SearchingFoodInSuccess(foods: foods));
  }

  addNutrients(AddNutrientEvent event, emit){
    nutrients.add(event.nutrient);
  }


  searchBySelected(SearchBySelectedEvent event, emit) async {
    emit(CollectAllSelectedState());
    await Future.delayed(Duration(seconds: 2));
    StringBuffer url = StringBuffer();
    url.write("https://api.edamam.com/api/food-database/v2/parser?session=40&app_id=62378f1f&app_key=5b15f03cad54329a05915d514a1aaed9");
    for(String i in nutrients){
      url.write(i);
    }
    nutrients.clear();
    emit(GettingMealsInProgressState());
    await Future.delayed(Duration(seconds: 2));
    MyResponse foods = await getIt<ApiService>().getSelectedFoods(url.toString());
    emit(GettingMealsInSuccessState(foods: foods.data!.hints));
  }
}
