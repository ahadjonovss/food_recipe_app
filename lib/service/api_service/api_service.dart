import 'package:dio/dio.dart';
import 'package:food_recipe_app/data/models/api_model/food_category.dart';
import 'package:food_recipe_app/data/models/api_model/food_health_type_model.dart';
import 'package:food_recipe_app/data/models/food_model/food_model.dart';
import 'package:food_recipe_app/data/models/my_response.dart';
import 'package:food_recipe_app/service/api_service/api_client.dart';

class ApiService extends ApiClient {

  Future<MyResponse> getDefaultMeals() async {
    MyResponse myResponse = MyResponse();
    try {
      print("Keldi");
      Response response = await dio.get(
          "https://api.edamam.com/api/food-database/v2/parser?app_id=62378f1f&app_key=5b15f03cad54329a05915d514a1aaed9&nutrition-type=cooking&health=no-oil-added&category=generic-foods");
      if (response.statusCode == 200) {
        print("hammasi yaxshi");
        myResponse.data = FoodModel.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
