 class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class DioHttpException extends AppException {
  DioHttpException([String? message]) : super(message, " ");
}

class ConnectionTimeOutException extends AppException {
  ConnectionTimeOutException([String? message]) : super(message, " ");
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, " ");
}

 class NewUserException extends AppException {
   NewUserException([String? message]) : super(message, " ");
 }