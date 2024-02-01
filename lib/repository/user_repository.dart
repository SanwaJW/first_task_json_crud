import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  String url = dotenv.get("API_BASE_URL", fallback: "");
  final dio = Dio();

  Future<dynamic> getData() async {
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      rethrow; // Rethrow the error for FutureBuilder to catch
    } finally {
      dio.close(); // Dispose Dio instance
    }
  }

  Future<dynamic> postData(
      String id, String firstName, String lastName, String department) async {
    final response = await dio.post(
      url,
      data: {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "department": department
      },
    );
    return response.data;
  }

  Future<dynamic> putData(
      String id, String firstName, String lastName, String department) async {
    try {
      final response = await dio.put(
        url + id, // Replace with the specific ID you want to update
        data: {
          "id": id,
          "firstName": firstName,
          "lastName": lastName,
          "department": department
        },
      );
      return response.data;
    } catch (error) {
      rethrow;
    } finally {
      dio.close();
    }
  }

  Future<dynamic> deleteData(String id) async {
    try {
      final response = await dio.delete(
        url + id, // Replace with the specific ID you want to delete
      );
      return response.data;
    } catch (error) {
      rethrow;
    } finally {
      dio.close();
    }
  }
}
