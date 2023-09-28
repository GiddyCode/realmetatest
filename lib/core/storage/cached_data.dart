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
  // Future<bool> cacheSelectedInterest({List<Categories>? interests}) async {
  //   print("Hit and saved: ${interests!.first.toJson()}");
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.setString(
  //     AppStrings.CACHE_INTEREST,
  //     json.encode(interests),
  //   );
  // }
  //
  // Future<List<Categories>> getSelectedInterest() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   final jsonString =
  //       await sharedPreferences.getString(AppStrings.CACHE_INTEREST);
  //   if (jsonString != null) {
  //     Categories data = Categories.fromJson(json.decode(jsonString));
  //     List<Categories> categories = [];
  //     return Future.value(categories);
  //   } else {
  //     return [];
  //   }
  // }

  Future<AuthResponse?> getAuthResponse() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString =
        sharedPreferences.getString(AppStrings.CACHE_AUTH_RESPONSE);
    // print("This is Daniel" + jsonString.toString());
    if (jsonString != null) {
      return Future.value(AuthResponse.fromJson(json.decode(jsonString)));
    } else {
      return null;
    }
  }

//   Future<String> getAuthStatus() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final state = sharedPreferences.getString(AppStrings.CACHE_STATE);
//     if (state != null) {
//       return Future.value(state);
//     } else {
//       return Future.value(AppStrings.FRESH_INSTALL);
//     }
//   }

//   Future<bool> cacheAuthResponse({AuthResponse? response}) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.setString(
//       AppStrings.CACHED_AUTH_RESPONSE,
//       json.encode(response!.toJson()),
//     );
//   }

//   setFreshInstall() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     var status = sharedPreferences.setBool(
//       AppStrings.NEW_INSTALL, false
//     );
//     return status;
//   }

//  getFreshInstall() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final status = sharedPreferences.getBool(
//       AppStrings.NEW_INSTALL);
//     return status;
//   }

//   Future<bool> cacheUser({User? user}) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.setString(
//       AppStrings.CACHED_USER,
//       json.encode(user!.toJson()),
//     );
//   }

//   Future<User> getUser() async {
//     final sharedPreferences = await SharedPreferences.getInstance();

//     final jsonString =
//     sharedPreferences.getString(AppStrings.CACHED_USER);

//     print("User Data $jsonString");
//     if (jsonString != null) {
//       return Future.value(User.fromJson(json.decode(jsonString)));
//     } else {
//       return User();
//     }
//   }
}
