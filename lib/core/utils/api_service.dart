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
          var headers = {
    'Content-Type': 'application/json',
  };
var response = await _dio.post('$_baseUri$endpoint',data: data,options: Options(headers:headers ));
 return response.data ;
}
}

// class ApiService
// {
// final Dio dio = Dio();
// final _baseUri = "https://akhtarly-server.onrender.com/auth/signup";
// //ApiService({required this.dio});
// void postUser({required String name,required String email,required String password}) async{
//   try {
//   var data = {
//     "name":name ,
//     "email": email,
//     'password': password,
//   };
//  var headers = {
//     'Content-Type': 'application/json',
//   };

// var response =await dio.post(_baseUri,data: data, options: Options(headers: headers));

  
//   if (response.statusCode == 201) {
//       // Request successful, parse the response
//       var responseData = response.data;
//       print('Resource created successfully: $responseData');
//     } else if (response.statusCode == 403) {
//       // Request failed with validation errors
//       var errorResponse = response.data;
//       var state = errorResponse['state'];
//       var errors = errorResponse['errors'] as List<dynamic>;
//       print('State: $state');
//       print('Validation errors:');
//       for (var error in errors) {
//         print('- $error');
//       }
//     } else {
//       // Request failed with an unexpected status code
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   } catch (e) {
//     // Error handling
//     print('Error: $e');
//   }
// }
// }