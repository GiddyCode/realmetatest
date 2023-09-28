// import 'dart:convert';
// // ignore: unused_import
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../utils/app_strings.dart';
// import '../../models/shared_models/auth_response.dart';
//
// class StorageService {
//   final SharedPreferences _sharedPreferences;
//   // CachedData? _cachedData;
//
//   StorageService({required SharedPreferences sharedPreferences})
//       : _sharedPreferences = sharedPreferences;
//
//
//   Future<String?> authStateChanges() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final jsonString =
//         sharedPreferences.getString(AppStrings.CACHE_AUTH_RESPONSE);
//
//     if (jsonString != null) {
//       print(
//           'auth preference state ==== ${AuthResponse.fromJson(json.decode(jsonString)).studentInfo?.studentName}');
//       if (AuthResponse.fromJson(json.decode(jsonString))
//               .studentInfo
//               ?.studentName ==
//           null) {
//         return Future.value("UnAuthenticated");
//       } else {
//         return Future.value(AuthResponse.fromJson(json.decode(jsonString))
//             .studentInfo
//             ?.studentName);
//       }
//     } else {
//       return Future.value("UnAuthenticated");
//     }
//   }
//
//   // Future<AuthResponse?> getCurrentUser() async =>
//   //     await _cachedData!.getAuthResponse();
//
//   // String? getToken() {
//   //   _cachedData!.getAuthResponse().then((value) {
//   //     return value!.accessToken;
//   //   });
//   // }
//
//   // String? getToken() => _sharedPreferences.getString("token");
//
//   logout() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.setString(
//       AppStrings.CACHE_AUTH_RESPONSE,
//       "UnAuthenticated",
//     );
//   }
// }
