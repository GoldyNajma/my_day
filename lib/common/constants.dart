final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final String baseUrl = 'https://my-day-flutterfire.herokuapp.com';
final String signUpEndPoint = '/api/register';
final String signInEndPoint = '/api/login';
final String signOutEndPoint = '/api/logout';
final String getProfileEndPoint = '/api/profile';
final String noInternetConnectionError = 'No internet connection';
final String tasksEndPoint = '/api/tasks';
final String updateCheckTaskEndpoint = '/api/task/check';
final String emailAlreadyTakenError = 'The email has already been taken.';