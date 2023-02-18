import 'dart:async';

import 'package:bloc/bloc.dart';
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
  }


  getDefaultMeals(event, emit) async {
    emit(GettingMealsInProgressState());
    MyResponse myResponse = await getIt<ApiService>().getDefaultMeals();
    if(myResponse.error.isEmpty){
      emit(GettingMealsInSuccessState(foods: myResponse.data!));
    }else{
      emit(GettingMealsInFailuryState(status: myResponse.error));
    }
  }
}
