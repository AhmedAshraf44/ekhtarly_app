import 'package:dio/dio.dart';

class ApiService  {

final Dio _dio;
final _baseUri = "https://akhtarly-server.onrender.com/auth/";
  ApiService(this._dio);
Future<Map<String,dynamic>> post({required String endpoint,required Map<String,String>? data,}) async{
  // Map<String, dynamic> headers = {};
    // if (token != null) {
    //   headers.addAll({
    //     'Authorization': 'Bearer $token',
    //   });
    // }
    // print('Url = $uri data = $data token =$token');
var response = await _dio.post('$_baseUri$endpoint',data: data,);
 return response.data ;
}
}