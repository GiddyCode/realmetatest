// import 'package:flutter/material.dart';
// import '../../app_strings.dart';
//
// class TextUtils extends StatelessWidget {
//   final String text;
//   final Color textColor;
//   final String textType;
//   final int? maxLines;
//   final bool? isCurrencyTxt;
//
//   const TextUtils({Key? key, this.maxLines, required this.text, required this.textType, this.textColor = Colors.black, this.isCurrencyTxt = false}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(text, style: textStyle(textColor, textType, isCurrencyTxt), maxLines: maxLines ?? 1,);
//   }
//
//   textStyle(Color textColor, String textType, bool? isCurrencyTxt, ) {
//     if(isCurrencyTxt != null && isCurrencyTxt){
//       return TextStyle(fontSize: 14, color: textColor);
//     }
//     switch(textType){
//       case  AppStrings.bodyText : return TextStyle(
//           fontFamily: "ProductSans", fontSize: 16, color: textColor,
//       );
//       case  AppStrings.bodyTextSmall : return TextStyle(
//           fontFamily: "ProductSans", fontSize: 14, color: textColor
//       );
//       case  AppStrings.headerText : return TextStyle(
//           fontFamily: "ProductSans", fontSize: 18, color: textColor,
//       );
//       case  AppStrings.buttonText : return TextStyle(
//         fontSize: 16, color: textColor,
//       );
//       default: return const TextStyle();
//     }
//   }
// }
