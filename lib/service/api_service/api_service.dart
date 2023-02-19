import 'package:dio/dio.dart';
import 'package:food_recipe_app/data/models/api_model/food_category.dart';
import 'package:food_recipe_app/data/models/api_model/food_health_type_model.dart';
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
}
