import 'package:food_recipe_app/data/models/food_model/food_model.dart';

class MyResponse{
  String error;
  FoodModel? data;

  MyResponse({this.data,this.error=''});
}