import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthUser {
  final bool? isFeedsBusy;

  const AuthUser({this.isFeedsBusy = false});
  AuthUser copy({
    bool? isFeedsBusy,
  }) =>
      AuthUser(
        isFeedsBusy: isFeedsBusy ?? this.isFeedsBusy,
      );
}

final baseFeedsState = StateNotifierProvider<BaseFeedsNotifier, AuthUser>(
        (ref) => BaseFeedsNotifier());

class BaseFeedsNotifier extends StateNotifier<AuthUser> {
  BaseFeedsNotifier() : super(AuthUser());
  bool isFeedsBusy = false;

  void setAuthBusy(bool isBusy) {
    isFeedsBusy = isBusy;
    updateState();
  }

  void updateState() {
    final newState = state.copy(isFeedsBusy: isFeedsBusy);
    state = newState;
  }

  getProductList() async {

  }
}
