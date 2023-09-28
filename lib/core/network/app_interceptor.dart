import 'package:dio/dio.dart';
import '../di/injector.dart';
import '../models/shared_models/auth_response.dart';
import '../services/utils/storage_service.dart';
import '../storage/cached_data.dart';

class AppInterceptor extends Interceptor {
  // final StorageService _storageService = di<StorageService>();
  CachedData cachedData = CachedData();
  AppInterceptor();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    try {
      //TODO: change these 2 back when its availale.

      AuthResponse? res = await cachedData.getAuthResponse();
      String? accessToken = res!.token;

      accessToken ??= '';
      options.headers.addAll({
        "Authorization": "Bearer " + accessToken,
        "ContentType":
            "multipart/form-data; boundary=<calculated when request is sent>"
      });
    } catch (error, s) {
      options.headers.addAll({
        "ContentType":
            "multipart/form-data; boundary=<calculated when request is sent>"
      });
      print("onRequest error =>$error");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    if (response != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 400) {
      response.statusCode = 200;
    }
    if (response.statusCode == 422) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      // Todo handle logout
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    // ApiError.fromDio(err);
  }
}
