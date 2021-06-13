import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_day/common/constants.dart' as constants;
import 'package:my_day/data/models/request_body/request_body.dart';

class ApiService {
  ApiService._();
  
  static final ApiService instance = ApiService._();

  Future<dynamic> httpPost({
    required String endPoint, 
    required RequestBody body,
    String? authorization,
  }) async {
    String jsonString = json.encode(body.toJson());
    
    try {
      var response = await http.post(Uri.parse(constants.baseUrl + endPoint),
          headers: {
            'Authorization': '$authorization',
            'Content-Type': 'application/json'
          },
          body: jsonString,
      );
      return response;
    } on SocketException {
      return constants.noInternetConnectionError;
    }
  }
}