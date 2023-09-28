import 'package:dio/dio.dart';
import '../errors/error_response_model.dart';

class ApiError {
  int errorType = 0;
  ErrorResponse? errorResponse;
  ApiError({this.errorResponse});
  ApiError.fromDio(DioError dioError) {
    _handleError(dioError);
  }
  Future<void> _handleError(Object error) async {
    if (error is DioError) {
      DioError dioError = error;
      print(error.type);
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorResponse!.message = "Request cancel";
          break;
        case DioErrorType.connectionTimeout:
          errorResponse!.message = "Connection timeout";
          break;
        case DioErrorType.unknown:
          print('here: ${dioError.response!.data}');
          errorResponse!.message = "Error occurred";
          break;
        case DioErrorType.receiveTimeout:
          errorResponse!.message = "Timeout error";
          break;
        case DioErrorType.badResponse:
          errorType = dioError.response!.statusCode!;

          extractError(dioError.response!);
          break;
        case DioErrorType.sendTimeout:
          errorResponse!.message = "Time out";
          break;
        case DioErrorType.badCertificate:
          // TODO: Handle this case.
        case DioErrorType.connectionError:
          // TODO: Handle this case.
      }
    } else {
      errorResponse!.message = "Unknown error occur, try again";
    }
  }

  Future<ErrorResponse> extractError(Response response) async {
    String message = "";

    try {
      final errorRespose = ErrorResponse.fromJson(response.data);
      return errorRespose;
    } catch (err) {
      message = response.statusMessage ?? err.toString();
    }
    return ErrorResponse(message: message);
  }

  @override
  String toString() => '$errorResponse';
}
