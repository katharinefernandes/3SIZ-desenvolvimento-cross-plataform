import 'package:dio/dio.dart';

class CustomHttpClient {
  final Dio dio;

  CustomHttpClient() : dio = Dio();

  Future<Response> getProducts() async {
    return await dio.get('https://gdapp.com.br/api/fiap/products');
  }

  // dynamic - qualquer tipo de dado
  Future<Response> createProduct(Map<String, dynamic> data) async {
    return await dio.post('https://gdapp.com.br/api/fiap/products', data: data);
  }
}
