final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final String baseUrl = 'https://my-day-flutterfire.herokuapp.com';
final String signUpEndPoint = '/api/register';
final String signInEndPoint = '/api/login';
final String noInternetConnectionError = 'No internet connection';
final String createTaskEndPoint = '/api/tasks';