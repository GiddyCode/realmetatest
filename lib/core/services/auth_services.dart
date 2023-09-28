import 'dart:convert';
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
      print("this is the res $response");
      List<dynamic> data = json.decode(response.data);
      List<ProductResponse> products = response.data.map((dynamic item) => ProductResponse.fromJson(item)).toList();
      return products;
    } catch (e, s) {
      // HANDLE THIS LATER...
      print("this is the error $e");
      print("this is the error $s");
      // print("this is the res $res");
      return [];
    }
  }

  Future<ProductDetailsResponse?> productDetails(String num) async {
    try {
      final response = await _networkProvider.call("/products/$num", RequestMethod.get);
      ProductDetailsResponse res =  json.decode(response.data);
      return res;
    } catch (e) {
      // HANDLE THIS LATER...
      return null;
    }
  }

}
