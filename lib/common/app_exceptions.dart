import 'package:my_day/common/constants.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    String exceptionString = '';
    
    if (_prefix != null) {
      exceptionString += '$_prefix';
    } 
    if (_message != null) {
      exceptionString += _prefix == null || _prefix.isEmpty 
        ? ' $_message' 
        : ': $_message';
    }
    return exceptionString;
  }
}

class FetchDataException extends AppException {
  FetchDataException([message]) : super(message, "Error during communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, "Unauthorized Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid input");
}

class ServerException extends AppException {
  ServerException([message]) : super(message, 'Server error');
}

class NoDataException extends AppException {
  NoDataException([message]) : super(message, 'No data');
}

class NoInternetException extends AppException {
  NoInternetException() : super(noInternetConnectionError, '');
}

class UnexpectedErrorException extends AppException {
  UnexpectedErrorException() : super('Unexpected error', '');
}

class CacheException extends AppException {
  CacheException([message]) : super(message, 'Cache error');
}