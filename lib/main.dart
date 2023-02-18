import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/app/app.dart';
import 'package:food_recipe_app/app/bloc_obsrver.dart';
import 'package:food_recipe_app/utils/get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}



