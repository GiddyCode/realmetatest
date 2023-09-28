import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.textColor,
    required this.buttonColor,
    required this.buttonText,
    this.textSize,
    this.onTap,
  }) : super(key: key);

  final Color? textColor;
  final double? height;
  final double? width;
  final Color buttonColor;
  final double? textSize;
  final String buttonText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: height ?? 52,
          width: width ?? 100.w - 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: buttonColor),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: textSize ?? 20,
                fontWeight: FontWeight.bold,
                color: textColor ?? black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
