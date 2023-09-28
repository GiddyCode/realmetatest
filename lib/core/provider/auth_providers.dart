// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:schoolgate/core/di/injector.dart';
// import 'package:schoolgate/core/models/shared_models/auth_response.dart';
// import 'package:schoolgate/core/services/utils/storage_service.dart';
// import 'package:schoolgate/utils/app_strings.dart';


// final authStateChangesProvider = FutureProvider<String?>(
//     (ref) => ref.watch(sharedPreferencesServiceProvider).authStateChanges());

// final sharedPreferencesServiceProvider =
//     Provider<StorageService>((ref) => di<StorageService>());

// final accountTypeViewModelProvider = StateNotifierProvider<AccountTypeViewModel, ReturnModel>((ref) {
//   final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
//   return AccountTypeViewModel(sharedPreferencesService);
// });

// class AccountTypeViewModel extends StateNotifier<ReturnModel> {
//   AccountTypeViewModel(this.sharedPreferencesService)
//       : super( ReturnModel());
//   bool? isAuthenticated;
//   String? userType;
//   AuthResponse? savedAuthResponse;
//   final StorageService sharedPreferencesService;




//   Future<AuthResponse?> checkAuthentication() async {
//     var auth = await sharedPreferencesService.getCurrentUser();

//     if(auth != null) {
//       if(auth.user!.usertype == AppStrings.student){
//         isAuthenticated = true;
//         userType = AppStrings.student;
//         savedAuthResponse = auth;
//         final newState = state.copy(
//           isAuthenticated: isAuthenticated,
//           userType: userType,
//           savedAuthResponse: savedAuthResponse
//         );
//         state = newState;
//       } else if (auth.user!.usertype == AppStrings.extraDrive){
//         isAuthenticated = true;
//         userType = AppStrings.extraDrive;
//         savedAuthResponse = auth;
//         final newState = state.copy(
//             isAuthenticated: isAuthenticated,
//             userType: userType,
//             savedAuthResponse: savedAuthResponse
//         );
//         state = newState;
//       } else {
//         isAuthenticated = true;
//         userType = AppStrings.tutor;
//         savedAuthResponse = auth;
//         final newState = state.copy(
//             isAuthenticated: isAuthenticated,
//             userType: userType,
//             savedAuthResponse: savedAuthResponse
//         );
//         state = newState;
//       }
//     } else {
//       return null;
//     }
//   }

//   // bool get isAuthenticated => state.isAuthenticated!;
// }

// class ReturnModel {
//   final bool? isAuthenticated;
//   final AuthResponse? savedAuthResponse;
//   final String? userType;

//   ReturnModel( {this.isAuthenticated, this.savedAuthResponse, this.userType,});
//   ReturnModel copy({bool? isAuthenticated, AuthResponse? savedAuthResponse, String? userType}) => ReturnModel(
//         isAuthenticated: isAuthenticated ?? this.isAuthenticated,
//     savedAuthResponse: savedAuthResponse ?? this.savedAuthResponse,
//     userType: userType ?? this.userType
//       );


// }
