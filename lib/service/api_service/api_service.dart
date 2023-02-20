import 'package:dio/dio.dart';
import 'package:food_recipe_app/data/models/api_model/food_category.dart';
import 'package:food_recipe_app/data/models/api_model/food_health_type_model.dart';
import 'package:food_recipe_app/data/models/food_detailed/food_detailed.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:food_recipe_app/data/models/my_response.dart';
import 'package:food_recipe_app/service/api_service/api_client.dart';

class ApiService extends ApiClient {
  int page = 80;

  Future<MyResponse> getDefaultMeals() async {
    MyResponse myResponse = MyResponse();
    try {
      print("Page number $page");
      Response response = await dio.get(
          "https://api.edamam.com/api/food-database/v2/parser?session=$page&app_id=62378f1f&app_key=5b15f03cad54329a05915d514a1aaed9");
      page+=40;
      if (response.statusCode == 200) {
        print("hammasi yaxshi");
        myResponse.data = FoodModel.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
      print(e);
    }
    return myResponse;
  }


  Future<List> search(String word) async {
    print("Zapros ketdi");
    String url = "https://api.edamam.com/auto-complete?app_id=62378f1f&app_key=5b15f03cad54329a05915d514a1aaed9&q=$word";
    Response response = await dio.get(url);
    print("DATA KEGAAAAAN");
    if(response.statusCode==200){
      return response.data;
    }else{
      return [];
    }
  }


  Future<List<FoodDetailedModel>> getMealByName(String name) async {
    String url = "www.themealdb.com/api/json/v1/1/search.php?s=$name";
    Response response = await dio.get(url);
    if(response.statusCode==200){
      List<FoodDetailedModel> foods = response.data.map((e)=>FoodDetailedModel.fromJson(e));
      return foods;
    }else{
      return [];
    }

  }
}
