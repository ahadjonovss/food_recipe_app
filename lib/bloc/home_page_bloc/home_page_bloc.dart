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
  }

  List<Hint> meals=[];


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
    List foods = await getIt<ApiService>().getMealByName(event.name);
    print(foods);
    // emit(SearchingFoodInSuccess(foods: foods));
  }
}
