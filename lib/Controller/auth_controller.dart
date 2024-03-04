import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthController {
  // Dio _dio = Dio();
  // String _path = 'http://54.37.71.29:8055/users';

  Future<void> Signup(Map data) async {
    try {
      print(data);
      // Response res = await _dio.post(_path, data: json.encode(data));
      final res = await http.post(Uri.parse('http://45.37.71.29:8055/users'),
      headers: {'Content-Type':'application/json'}
      , body: jsonEncode(data));
      if (res.statusCode==204) {
        print('success');
        
      }else{
        throw Exception('failed to regester');
      }
      // print(res.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
