class CustomException implements Exception {
  final message;
  final prefix;

  CustomException([this.message, this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}

class ConnectionException extends CustomException {
  ConnectionException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class ServerErrorException extends CustomException {
  ServerErrorException([message]) : super(message, "Internal server error: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class UnknownException extends CustomException {
  UnknownException([String message]) : super(message, "Unknown error: ");
}
