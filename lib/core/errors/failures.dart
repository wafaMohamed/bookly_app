import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}
class ServerFailure extends Failures {
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.fromDioError(DioException dioExceptionErrorType) {
    switch (dioExceptionErrorType.type) {
      case DioExceptionType.connectionTimeout: // Update this line
        return ServerFailure("Connection TimeOut");
      case DioExceptionType.receiveTimeout: // Update this line
        return ServerFailure("receive Timeout");
      case DioExceptionType.sendTimeout: // Update this line
        return ServerFailure("send Timeout");
      case DioExceptionType.badResponse: // Update this line
        return ServerFailure.fromResponse(
            dioExceptionErrorType.response!.statusCode!, dioExceptionErrorType.response!.data);
      case DioExceptionType.cancel: // Update this line
        return ServerFailure("Request was cancelled ");
      case DioExceptionType.unknown: // Update this line
        if (dioExceptionErrorType.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        } else {
          return ServerFailure("UnExpected Error , Please try again");
        }
      default:
        return ServerFailure("Oops UnExpected Error ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request Not Found ,Please try again later");
    } else if (statusCode == 500) {
      return ServerFailure("internal server error ,Please try again later");
    } else {
      return ServerFailure("There was an error ,Please try again");
    }
  }
}
