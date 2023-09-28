import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_strings.dart';
import '../../assets.dart';
import '../../text_utils.dart';
import '../../theme/app_colors.dart';

class Input extends StatelessWidget {
  final void Function()? toggleEye;
  final void Function(String)? onChange;
  final void Function()? onSaved;
  final void Function()? onEditingComplete;
  final void Function()? onFieldSubmitted;
  final void Function()? suffixClick;
  final double textSize;
  final bool isPassword;
  final String? hintText;
  final bool showObscureText;
  final bool obscureText;
  final TextInputType? inputType;
  final Color foreground;
  final int? maxValue;
  final bool hasBorder;
  final bool hasPrefix;
  final String? prefix;
  final bool hasSuffux;
  final bool isCard;
  final Widget? icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  const Input(
      {Key? key,
      this.toggleEye,
      this.onEditingComplete,
      this.prefix,
      this.suffixClick,
      required this.controller,
      this.obscureText = false,
      this.showObscureText = false,
      this.isPassword = false,
      this.inputType,
      this.maxValue,
      this.hasBorder = true,
      this.isCard = false,
      this.hasSuffux = false,
      this.foreground = Colors.black,
      this.validator,
      this.icon,
      this.inputFormatters,
      this.hintText,
      this.hasPrefix = false,
      this.onChange,
      this.textSize = 18,
      this.onSaved,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      maxLength: maxValue,
      inputFormatters: inputFormatters,
      onChanged: onChange,
      onEditingComplete: onEditingComplete,
      style: TextStyle(
        fontFamily: "ProductSans",
        color: Colors.black.withOpacity(0.7),
        fontSize: textSize,
        //letterSpacing: 1.3,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        contentPadding: hasBorder
            ? const EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 5)
            : const EdgeInsets.only(top: 20, bottom: 13, left: 10, right: 5),
        hintStyle: TextStyle(
          fontFamily: "ProductSans",
          color: Colors.black.withOpacity(0.38),
          fontSize: textSize,
          //letterSpacing: 1.2,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        enabledBorder: hasBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.38),
                ),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.38),
                ),
                borderRadius: BorderRadius.circular(7)),
        focusedBorder: hasBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: studentGreenBackgroundAlt),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.38),
                ),
                borderRadius: BorderRadius.circular(7)),
        border: hasBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.38),
                ),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.38),
                ),
                borderRadius: BorderRadius.circular(7)),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 19, minWidth: 19),
        suffixIcon: isPassword
            ? SizedBox(
                height: 19,
                child: GestureDetector(
                    onTap: toggleEye,
                    child: SvgPicture.asset(
                      SvgAssets.eyeSvg,
                      height: 5,
                      width: 5,
                      color: showObscureText ? primaryColor : null,
                    )),
              )
            : hasSuffux
                ? GestureDetector(
                    onTap: suffixClick,
                    child: const Icon(Icons.keyboard_arrow_down),
                  )
                : const Text(''),
        prefix: hasPrefix
            ? Text(
                prefix ?? "@",
                style: const TextStyle(
                  fontFamily: "ProductSans",
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            : isCard
                ? icon
                : null,
      ),
    );
  }
}

Widget inputTile(TextEditingController controller, String title,
    TextInputType? inputType, bool hasPrefix, String? prefix) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 3.0),
        child: TextUtils(
          text: title,
          textType: AppStrings.bodyTextSmall,
          textColor: Colors.grey,
        ),
      ),
      Card(
        elevation: 2,
        child: Input(
          controller: controller,
          inputType: inputType,
          hasPrefix: hasPrefix,
          prefix: prefix,
        ),
      ),
    ],
  );
}
