// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:schoolgate/core/provider/auth_providers.dart';

// import 'empty_content.dart';

// class AuthWidget extends ConsumerWidget {
//   const AuthWidget({
//     Key? key,
//     required this.nonSignedInBuilder,
//     required this.studentSignedInBuilder,
//     required this.tutorSignedInBuilder,
//     required this.extraDriveSignedInBuilder,
//   }) : super(key: key);

//   final WidgetBuilder nonSignedInBuilder;
//   final WidgetBuilder studentSignedInBuilder;
//   final WidgetBuilder tutorSignedInBuilder;
//   final WidgetBuilder extraDriveSignedInBuilder;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authStateChanges = ref.watch(authStateChangesProvider);
//     return authStateChanges.when(
//         data: (loginType) => _data(context, loginType),
//         error: (_, __) => const Scaffold(
//               body: EmptyContent(
//                 title: 'Something went wrong',
//                 message: 'Can\'t load data right now.',
//               ),
//             ),
//         loading: () => const Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ));
//   }

//   Widget _data(BuildContext context, String? loginType) {
//     print('current login type is : $loginType');
//     switch(loginType){
//       case  "tutor" : return tutorSignedInBuilder(context);
//       case "student" : return studentSignedInBuilder(context);
//       case "extradrive": return extraDriveSignedInBuilder(context);
//       default: return nonSignedInBuilder(context);
//     }
//   }
// }


