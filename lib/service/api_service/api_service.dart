import 'package:dio/dio.dart';
import 'package:food_recipe_app/data/models/my_response.dart';
import 'package:food_recipe_app/service/api_service/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getRandomUser() async {
    MyResponse myResponse=MyResponse();
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/api/");
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