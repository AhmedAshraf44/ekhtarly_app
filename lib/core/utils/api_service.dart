import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;
  final _baseUri = "https://akhtarly.onrender.com/";
  final _baseUriAuth = "auth/";
//"https://akhtarly-server.onrender.com/auth/";
  ApiService(this._dio);
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, String>? data,
  }) async {
    Map<String, dynamic> headers = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (prefs.getString('token') == null) {
      prefs.setString('token', '');
    } else {
      // var token = prefs.getString('token');
      headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
    }
   // log('data = $data token =$token');
    //         var headers = {
    //   'Content-Type': 'application/json',
    // };
    var response = await _dio.post('$_baseUri$_baseUriAuth$endpoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endpoint,
    required Map<String, String>? data,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await _dio.patch('$_baseUri$_baseUriAuth$endpoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }
  Future<Map<String, dynamic>> get({
  required String endpoint,
}) async {
  Map<String, dynamic> headers = {};
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
    if (prefs.getString('token') == null) {
      prefs.setString('token', '');
    } else {
      // var token = prefs.getString('token');
      headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
    }
   // log('token =$token');
  var response = await _dio.get('$_baseUri$endpoint',options: Options(headers: headers));
  return response.data;
}

}

