import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:news/core/network/api_constant.dart';
import 'package:news/featurs/home/model/news_response.dart';
class ApiService{
  Dio? _dio;
  Dio getDio(){
    _dio ??= Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))..interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true
    ));
    return _dio!;
  }

  Future<NewsResponse> fetchTopHeadlines() async {
    try {

      var response = await  getDio().get(ApiConstants.topHeadlines,queryParameters: {
        "country": "us",
        "apiKey": ApiConstants.apiKey
      });
      if(response.statusCode == 200){
        return NewsResponse.fromJson(response.data);
      }else{
        throw Exception("Failed to load top headlines${response.statusCode}");

      }
    }catch(e){
      throw Exception("Api error ${e.toString()}");
    }

  }
  Future fetchByCategory() async {
    try {

      var response = await   getDio().get(ApiConstants.topHeadlines,queryParameters: {
        "country": "us",
        "apiKey": ApiConstants.apiKey,
        "category": "business"
      });
      if(response.statusCode == 200){
        return NewsResponse.fromJson(response.data);
      }else{
        throw Exception("Failed to load data${response.statusCode}");

      }
    }catch(e){
      throw Exception("Api error ${e.toString()}");
    }
  }



}