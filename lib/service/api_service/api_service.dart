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
      Response response = await dio.get(
          dio.options.baseUrl);
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
