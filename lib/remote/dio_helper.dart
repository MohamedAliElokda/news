import 'package:dio/dio.dart';

import '../shared/Strings.dart';

class DioHelper {
  static Dio ? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Strings.BASE_URL, receiveDataWhenStatusError: true));
  }

  static Future<Response>
  getData({required String url, required Map<String, dynamic> query}) async
  {
    return await dio!.get(url, queryParameters: query);
  }


}
