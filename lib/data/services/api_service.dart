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

  Future<dynamic> httpGet({
    required String endPoint, 
    Map<String, String>? params,
    String? authorization
  }) async {
    String paramsString = params?.entries
      .map((param) => '${param.key}=${param.value}')
      .toList()
      .join('&') ?? '';
    
    try {
      String url = constants.baseUrl + endPoint + '?' + paramsString;
      var response = await http.get(Uri.parse(url),
          headers: {
            'Authorization': '$authorization',
            'Content-Type': 'application/json'
          },
      );
      return response;
    } on SocketException {
      return constants.noInternetConnectionError;
    }
  }

  Future<dynamic> httpPut({
    required String endPoint, 
    required RequestBody body,
    String? authorization,
  }) async {
    String jsonString = json.encode(body.toJson());
    
    try {
      var response = await http.put(Uri.parse(constants.baseUrl + endPoint),
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