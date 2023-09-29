import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/models/product_details_response.dart';
import '../../../../core/models/product_response.dart';
import '../../../../core/services/auth_services.dart';

class ProductDetailsVM {
  final bool? loading;

  const ProductDetailsVM({this.loading = false});
  ProductDetailsVM copy({
    bool? loading,
  }) =>
      ProductDetailsVM(
        loading: loading ?? this.loading,
      );


}

final ProductDetailsVMState = StateNotifierProvider<BaseFeedsNotifier, ProductDetailsVM>(
        (ref) => BaseFeedsNotifier());

class BaseFeedsNotifier extends StateNotifier<ProductDetailsVM> {
  BaseFeedsNotifier() : super(ProductDetailsVM());
  bool loading = false;

  void setAuthBusy(bool isBusy) {
    loading = isBusy;
    updateState();
  }

  void updateState() {
    final newState = state.copy(loading: loading);
    state = newState;
  }

  getProductList() async {

  }

  Future<ProductDetailsResponse>? fetchData(String id) async {
    AuthService _authService = AuthService();
    ProductDetailsResponse? products = await _authService.productDetails(id);
    return products!;
  }
}
