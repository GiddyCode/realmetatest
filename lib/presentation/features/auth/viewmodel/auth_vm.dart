import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realmetatest/core/services/local_db/local_db.dart';
import 'package:realmetatest/presentation/features/product_list/view/listofproducts.dart';
import 'package:realmetatest/utils/context_extension.dart';

import '../../../../utils/validator_service.dart';

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

  final TextEditingController fullname = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController lUsernameController = TextEditingController();
  final TextEditingController LEmailController = TextEditingController();
  final TextEditingController LPasswordController = TextEditingController();




  void setAuthBusy(bool isBusy) {
    isFeedsBusy = isBusy;
    updateState();
  }

  void updateState() {
    final newState = state.copy(isFeedsBusy: isFeedsBusy);
    state = newState;
  }

  // Function to handle signup
  void handleSignup( String username,
      String email,
      String password,
      String passwordConfirm, BuildContext context ) async {
    final ValidationService _validationService = ValidationService();

    if(username.isEmpty || email.isEmpty || password.isEmpty || passwordConfirm.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('One or more fields are empty'),
        ),
      );
    } else if(!_validationService.validateEmail(email))
{
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('email is not valid, enter a valid email'),
    ),
  );
}
    else if(passwordConfirm != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ensure that your password and confirm passwords are same'),
        ),
      );
    } else {
      final dbHelper = DatabaseHelper();
      await dbHelper.insertUser(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SignUp Successful'),
        ),
      );
      context.push(ListOfProducts());
    }
  }



//user login
  Future<void> login(String email, String password, BuildContext context) async {
    final ValidationService _validationService = ValidationService();

    final dbHelper = DatabaseHelper();
    final user = await dbHelper.getUser(email, password);
    if(!_validationService.validateEmail(email))
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('email is not valid, enter a valid email'),
        ),
      );
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password is empty'),
        ),
      );
    }
    else if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Welcome...'),
        ),
      );
      context.push(ListOfProducts());
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cant find user; please sign up'),
        ),
      );
    }
  }


}
