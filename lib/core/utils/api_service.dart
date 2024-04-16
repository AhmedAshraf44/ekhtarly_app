 import 'package:dio/dio.dart';

class ApiService  {

final Dio _dio;
final _baseUri = "https://akhtarly.onrender.com/auth/";
//"https://akhtarly-server.onrender.com/auth/";
  ApiService(this._dio);
Future<Map<String,dynamic>> post({required String endpoint,required Map<String,String>? data,}) async{
  // Map<String, dynamic> headers = {};
    // if (token != null) {
    //   headers.addAll({
    //     'Authorization': 'Bearer $token',
    //   });
    // }
    // print('Url = $uri data = $data token =$token');
          var headers = {
    'Content-Type': 'application/json',
  };
var response = await _dio.post('$_baseUri$endpoint',data: data,options: Options(headers:headers ));
 return response.data ;
}

Future<Map<String,dynamic>> patch({required String endpoint,required Map<String,String>? data,}) async{
   var headers = {
    'Content-Type': 'application/json',
  };
var response = await _dio.patch('$_baseUri$endpoint',data: data,options: Options(headers: headers));
return response.data;
}
}