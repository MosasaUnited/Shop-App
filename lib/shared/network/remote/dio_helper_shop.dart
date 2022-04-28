import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init(){
    print('DioHelper Initialized');

    dio = Dio(
          BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };

    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}