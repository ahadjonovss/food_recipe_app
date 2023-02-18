import 'package:dio/dio.dart';
import 'package:food_recipe_app/data/models/my_response.dart';
import 'package:food_recipe_app/service/api_service/api_client.dart';

class ApiService extends ApiClient {
  String apiKey = "5b15f03cad54329a05915d514a1aaed9";
  String appId = "62378f1f";
  Future<MyResponse> getMeals() async {
    MyResponse myResponse = MyResponse();
    try {
      print("Keldi");
      Response response = await dio.get(
          "${dio.options.baseUrl}/v2/parser?app_id=$appId&app_key=$apiKey&nutrition-type=cooking&health=alcohol-free&category=generic-foods");
      if (response.statusCode == 200) {
        print("hammasi yaxshi");
        //myResponse.data = UserModel.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
