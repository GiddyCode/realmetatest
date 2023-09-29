// import "package:flutter/material.dart";
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sizer/sizer.dart';
// import 'app_strings.dart';
//
// class ToastWidget extends StatelessWidget {
//   final String type;
//   final String description;
//   const ToastWidget({Key? key, required this.type, required this.description})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           height: 7.h,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(
//                   color: type == AppStrings.error
//                       ? const Color(0xffdd5f5f)
//                       : const Color(0xff1FCB54)),
//               color: type == AppStrings.error
//                   ? const Color(0xfffdfdfd)
//                   : const Color(0xfff0fff4)),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               type == 'error'
//                   ? const FaIcon(FontAwesomeIcons.shield)
//                   : const FaIcon(FontAwesomeIcons.check),
//               // : Image.asset(
//               //     ImageAssets.successIcons,
//               //     scale: 3.5,
//               //   ),
//               // AppSpacer.W5,
//               Expanded(
//                   child: Text(
//                 description,
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontFamily: AppStrings.productSans,
//                   color: type == AppStrings.error
//                       ? const Color(0xffed8b88)
//                       : const Color(0xff1ea344),
//                 ),
//               )),
//               // SvgPicture.asset(
//               //   SvgAssets.cancel,
//               //   color: type == AppStrings.error
//               //       ? const Color(0xffed8b88)
//               //       : const Color(0xff1ea344),
//               //   height: 20,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
