import 'dart:convert';
import 'package:realmetatest/core/models/shared_models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_strings.dart';

class CachedData {
  Future<bool> cacheAuthResponse({dynamic authResponse}) async {
    // print("This is dara" + authResponse.toString());
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      AppStrings.CACHE_AUTH_RESPONSE,
      json.encode(authResponse),
    );
  }

  Future<bool> cacheToken({String? token}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
        AppStrings.CACHE_TOKEN, json.encode(token));
  }


  Future<AuthResponse?> getAuthResponse() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString =
        sharedPreferences.getString(AppStrings.CACHE_AUTH_RESPONSE);
    if (jsonString != null) {
      return Future.value(AuthResponse.fromJson(json.decode(jsonString)));
    } else {
      return null;
    }
  }

}
