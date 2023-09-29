// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:dio/dio.dart';
// import 'package:oktoast/oktoast.dart';
// import '../../utils/toast_widget.dart';
import 'app_interceptor.dart';

/// To use this class just call
/// final networkProvider = NetworkProvider();
// networkProvider.call(path, method);
/// This class should be injected to all your services class that need to make network calls
class NetworkProvider {
  static const Duration CONNECT_TIME_OUT = Duration(seconds: 30);
  static const Duration RECEIVE_TIME_OUT = Duration(seconds: 30);
  Dio? dio;
  NetworkProvider(
      {String baseUrl = "https://fakestoreapi.com", String? authToken}) {
    dio = Dio(
      BaseOptions(
          connectTimeout: CONNECT_TIME_OUT,
          receiveTimeout: RECEIVE_TIME_OUT,
          baseUrl: baseUrl),
    );
    dio!.interceptors
      ..add(LogInterceptor(
          requestBody: true, responseBody: true, requestHeader: true))
      ..add(AppInterceptor());
  }
  NetworkProvider.test(this.dio);
  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? queryParams,
    data,
    Options? options,
    FormData? formData,
  }) async {
    Response response;
    var params = queryParams ?? <String, dynamic>{};
    params.addAll(requiredParams);
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio!.post(path,
              queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.get:
          response =
              await dio!.get(path, queryParameters: params, options: options);
          break;
        case RequestMethod.put:
          response = await dio!
              .put(path, queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.delete:
          response = await dio!.delete(path,
              queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.upload:
          response = await dio!.post(path,
              queryParameters: params, data: data, options: options);
          break;
      }
      // if (response.data['status_code'] != null &&
      //     response.data['status_code'] != 200) {
      //   ErrorResponse e = ErrorResponse.fromJson(response.data);
      //   return Future.error(e);
      // }
      return response;
    } on DioError catch (error) {
      print('this is where the error is from');
      // ErrorResponse e = ErrorResponse.fromJson(error.response!.data);
      // String errorMessage = e.message!;
      // showToastWidget(ToastWidget(type: 'error', description: errorMessage));
      return Future.error(e.toString());
    }
  }

  Map<String, dynamic> get requiredParams {
    //Todo add all required params for your endpoint here if any
    var params = <String, dynamic>{};
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload }
