import 'package:dio/dio.dart';
import 'package:project02/model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get("/posts");

      // Dio already decodes JSON
      List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch posts: ${e.message}");
    }
  }
}
