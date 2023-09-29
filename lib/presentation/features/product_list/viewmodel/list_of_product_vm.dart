import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/models/product_response.dart';
import '../../../../core/services/auth_services.dart';
import '../view/product_item.dart';

class ListOfProductsVM {
  final bool? loading;

  const ListOfProductsVM({this.loading = false});
  ListOfProductsVM copy({
    bool? loading,
  }) =>
      ListOfProductsVM(
        loading: loading ?? this.loading,
      );


}

final ListOfProductsVMState = StateNotifierProvider<BaseFeedsNotifier, ListOfProductsVM>(
        (ref) => BaseFeedsNotifier());

class BaseFeedsNotifier extends StateNotifier<ListOfProductsVM> {
  BaseFeedsNotifier() : super(ListOfProductsVM());
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

  Future<List<MyItem>> fetchData() async {

    AuthService _authService = AuthService();
    List<ProductResponse>? products = await _authService.listOfProduct();

    return List.generate(
      products.length, (index) => MyItem(
      icon: products[index].image != null ? Container(
        height: 20.w,
        width: 20.w,
        child: Image.network(products[index].image!),
      ) : const Icon(Icons.supervised_user_circle_outlined) ,
      title: products[index].title ?? "",
      subtitle: products[index].description ?? "",
      actionText: "CAD ${products[index].price.toString()}" ?? "",
    ),
    );
  }
}
