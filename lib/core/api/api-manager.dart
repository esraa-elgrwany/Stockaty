import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/utils/constants.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(String endPoint, {Map<String, dynamic>? data}) {
    return dio.get(Constants.baseUrl + endPoint, queryParameters: data);
  }

  postData(String endPoint,{Map<String,dynamic>?body,String?token}) {
    return dio.post(Constants.baseUrl + endPoint,
        data: body,
        options: Options(
      headers: {
        "token":token
      }
    ));
  }


}
