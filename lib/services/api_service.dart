import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/recipes', 
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<dynamic>> fetchRecipes() async {
    try {
      final response = await _dio.get('/');
      return response.data['recipes']; 
    } catch (e) {
      print(' خطأ أثناء جلب الوصفات: $e');
      return [];
    }
  }
}
