import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils.dart';

class LogoWithUserType extends StatelessWidget {
  const LogoWithUserType({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          "assets/svgs/test_test.png",
          height: 12.h,
          width: 75.w,
        ),
        // SvgPicture.asset(AssetsPath.schoolGateImageWithCapDark),
        Text(user,
            style: TextStyle(
              color: user == 'Student' ? studentGreen : creatorYellow,
              fontFamily: 'ProductSans',
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ))
      ],
    );
  }
}
