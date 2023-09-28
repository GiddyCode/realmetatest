
// import 'package:flutter/material.dart';
// import 'package:schoolgate/feature/shared_feature/pages/user_access/onboarding/screens/user_type_page.dart';
// import 'package:schoolgate/utils/context_extension.dart';
// import 'package:schoolgate/utils/theme/app_colors.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DialogUtility {
//   static DialogUtility? utility;
//   static DialogUtility? getInstance() {
//     utility ??= DialogUtility();
//     return utility;
//   }

//   showAlertDialog(
//       BuildContext context,
//       String alertMessage,
//       String positiveButton,
//       String negativeButton,
//       final void Function() onPressed) {
//     // set up the buttons
//     Widget cancelButton = FlatButton(
//       child: Text(negativeButton),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//     Widget continueButton =
//         FlatButton(child: Text(positiveButton), onPressed: onPressed);
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Text(
//               alertMessage,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   showLogoutAlertDialog(BuildContext context, String alertMessage,
//       String positiveButton, String negativeButton) {
//     // set up the buttons
//     Widget cancelButton = TextButton(
//       child: Text(negativeButton, style: const TextStyle(
//         fontSize: 16,
//         color: darkAshVariantAlternate,
//         fontFamily: "ProductSans",
//         fontWeight: FontWeight.normal,
//       ),),
//       onPressed: () async {
//         SharedPreferences preferences = await SharedPreferences.getInstance();
//         await preferences.clear();
//         context.pushReplacement(const SelectUserType());
//       },
//     );
//     Widget continueButton = TextButton(
//       child: Text(positiveButton, style: const TextStyle(
//         fontSize: 16,
//         color: darkAshVariantAlternate,
//         fontFamily: "ProductSans",
//         fontWeight: FontWeight.normal,
//       ),),
//       onPressed: () {
//         context.pop();
//       },
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Text(
//               alertMessage,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: darkAshVariantAlternate,
//                 fontFamily: "ProductSans",
//                 fontWeight: FontWeight.normal,
//               ),
//             )
//           ],
//         ),
//       ),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
