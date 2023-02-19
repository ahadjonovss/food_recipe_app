import 'package:food_recipe_app/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:food_recipe_app/service/api_service/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => HomePageBloc());
}