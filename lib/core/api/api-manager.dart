import 'package:dio/dio.dart';
import 'package:my_shopping_app/core/utils/constants.dart';

class ApiManager{

  Dio dio=Dio();

 Future<Response> getData(String endPoint, {Map<String, dynamic>?data}){
  return dio.get(Constants.baseUrl+endPoint,queryParameters: data);
  }

  postData(String endPoint,Map<String,dynamic>body){
    return dio.post(Constants.baseUrl+endPoint,data: body);
  }
}