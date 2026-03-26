import 'package:dio/dio.dart';

class CustomHttpClient {
  final Dio dio;

  CustomHttpClient() : dio = Dio();

  Future<Response> getBikes() async {
    return await dio.get('https://gdapp.com.br/api/fiap/bikes');
  }
}
