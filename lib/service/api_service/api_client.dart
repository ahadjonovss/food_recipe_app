import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipe_app/service/api_service/custom_exceptions.dart';

class ApiClient{

  ApiClient(){
    _init();
  }

  late Dio dio;
  String apiKey = "5b15f03cad54329a05915d514a1aaed9";
  String appId = "62378f1f";

  _init(){
    dio=Dio(
        BaseOptions(
            baseUrl: "https://api.edamam.com/api/food-database/v2/parser?session=80&app_id=62378f1f&app_key=5b15f03cad54329a05915d514a1aaed9",
            connectTimeout: 25000,
            receiveTimeout: 20000
        )
    );

    dio.interceptors.add(InterceptorsWrapper(
        onError: ((error, handler) {
          print("Error has accured");
          switch(error.type){
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
              throw DeadlineExceededException(error.requestOptions);
            case DioErrorType.receiveTimeout:
              throw ReceiveTimeOutException(error.requestOptions);
              break;
            case DioErrorType.response:
              switch(error.response?.statusCode){case 400:
                throw BadRequestException(error.response?.data['message']);
                case 401:
                  throw UnauthorizedException(error.requestOptions);
                case 404:
                  throw NotFoundException(error.requestOptions);
                case 409:
                  throw ConflictException(error.requestOptions);
                case 500:
                case 501:
                case 503:
                  throw InternalServerErrorException(error.requestOptions);
              }
              break;
            case DioErrorType.cancel:
              break;
              break;
            case DioErrorType.other:
              throw NoInternetConnectionException(error.requestOptions);
          }
          debugPrint('Error Status Code:${error.response?.statusCode}');
          return handler.next(error);
        }),
        onRequest: (requestOptions, handler) {
          print("Request sent");
          String currentLocale = "uz";
          requestOptions.headers["Accept"] = "application/json";
          requestOptions.headers["Accept-Language"] =
          currentLocale.isEmpty ? "ru" : currentLocale;
          return  handler.next(requestOptions);
        },
        onResponse: (Response response,ResponseInterceptorHandler handler ){
          print("Response has recieved");
          return handler.next(response);
        }

    ));
  }
}