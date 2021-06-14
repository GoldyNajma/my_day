import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_day/common/app_exceptions.dart';
import 'package:my_day/common/constants.dart' as constants;
import 'package:my_day/data/models/api_responses/get_profile_response.dart';
import 'package:my_day/data/models/user.dart';
import 'package:my_day/data/services/api_service.dart';

class UserRemoteService {
  static final UserRemoteService instance = UserRemoteService._();
  final ApiService _apiService = ApiService.instance;

  UserRemoteService._();

  Future<User> getProfile(String authorizationToken) async {
    var response = await _apiService.httpGet(
      endPoint: constants.getProfileEndPoint, 
      authorization: authorizationToken,
    );
    
    if (response is http.Response) {
      var responseBody;
      
      try {
        responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      } on FormatException {
        if (response.statusCode == 500) {
          throw ServerException(response.reasonPhrase);
        } else {
          throw NoDataException('Server returned no data. ${response.reasonPhrase}');
        }
      }

      if (response.statusCode == 200) {
        GetProfileResponse showProfileResponse = GetProfileResponse.fromJson(responseBody);

        return showProfileResponse.data!;
      } else {
        throw ServerException(response.reasonPhrase);
      }
    } else if (response is String && response == constants.noInternetConnectionError) {
      throw NoInternetException();
    } else {
      throw UnexpectedErrorException();
    }
  }
}