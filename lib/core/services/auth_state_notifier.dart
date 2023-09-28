// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:schoolgate/core/models/shared_models/auth_response.dart';
// import 'package:schoolgate/core/services/auth_services.dart';
// import 'package:schoolgate/core/services/utils/validation_service.dart';

// class AuthResponseData {
//   final AuthResponse? authResponse;
//   final bool isLoading;
//   final bool isStudent;
//   const AuthResponseData({
//     this.authResponse,
//     this.isLoading = true,
//     this.isStudent = false,
//   });

//   AuthResponseData copy({
//     AuthResponse? authResponse,
//     bool? isLoading,
//     bool? isStudent,
//   }) => AuthResponseData(
//     authResponse: authResponse ?? this.authResponse,
//     isLoading: isLoading ?? this.isLoading,
//     isStudent: isStudent ?? this.isStudent,
//   );
// }


// final authStateNotifier = StateNotifierProvider<AuthStateNotifier, AuthResponseData>((ref) => AuthStateNotifier());

// class AuthStateNotifier extends StateNotifier<AuthResponseData> {
//   AuthStateNotifier() : super(const AuthResponseData());

//   AuthResponse? authResponse;
//   bool busy = true;
//   bool isStudent = false;
//   AuthService authService = AuthService();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final ValidationService _validationService = ValidationService();





//   setAuthResponse({AuthResponse? response}) {
//     if(response != null) {
//       authResponse = response;
//       busy = false;
//       final newState = state.copy(
//         authResponse: authResponse,
//         isLoading: busy,
//         isStudent: isStudent,
//       );
//       state = newState;
//     }
//   }


//   Future getAuthResponse() async {
//     final newState = state.copy(
//       authResponse: authResponse,
//       isLoading: busy,
//       isStudent: isStudent
//     );
//     state = newState;
//   }

//   checkStudentType (String checkUserType) async {
//     bool std;
//     if (checkUserType == 'Student') {
//       std = true;
//     } else {
//       std = false;
//     }
//     isStudent = std;
//     final newState = state.copy(
//       authResponse: authResponse,
//       isLoading: busy,
//       isStudent: std,
//     );
//     state = newState;
//   }

//   // String strengthPassword(String value) {
//   //   return _validationService.strengthPassword(value);
//   // }

//   // String validatePassword(String password) {
//   //   bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
//   //   bool hasDigits = password.contains(RegExp(r'[0-9]'));
//   //   bool hasLowercase = password.contains(RegExp(r'[a-z]'));
//   //   bool hasSpecialCharacters =  password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//   //
//   //   if (password.length < 8) {
//   //     return "Password not strong";
//   //   } else {
//   //     return " ";
//   //   }
//   // }


// }