import 'dart:convert';
import 'package:logger/logger.dart';

import '../models/product_details_response.dart';
import '../models/product_response.dart';
import '../network/network_provider.dart';
import '../../utils/toast_widget.dart';
import '../storage/cached_data.dart';
import 'auth_error.dart';
import 'auth_success.dart';

class AuthService {
  final NetworkProvider _networkProvider;
  final CachedData _cachedData;

  AuthService({
    NetworkProvider? networkProvider,
    CachedData? cachedData,
  })  : _networkProvider = networkProvider ?? NetworkProvider(),
        _cachedData = cachedData ?? CachedData();


  Future<List<ProductResponse>> listOfProduct() async {
    try {
      final response = await _networkProvider.call("/products", RequestMethod.get);
      final List<dynamic> data = response.data;
      final products = data.map((item) => ProductResponse.fromJson(item)).toList();
      return products;
    } catch (e, s) {

      return [];
    }
  }

  Future<ProductDetailsResponse?> productDetails(String num) async {
    try {
      final response = await _networkProvider.call("/products/$num", RequestMethod.get);
      final data = response.data;
      final products = ProductDetailsResponse.fromJson(data);
      return products;
    } catch (e, s) {
      print("this is where the issue is from $s");
      // HANDLE THIS LATER...
      return null;
    }
  }

}
