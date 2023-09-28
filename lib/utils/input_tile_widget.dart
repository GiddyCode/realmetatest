import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'theme/app_colors.dart';

class TextInputTile extends StatefulWidget {
  const TextInputTile(
      {Key? key,
      required this.tileName,
      required this.tileIcon,
      this.validator,
      this.inputType,
      this.onChange,
      this.isPassword = false,
      required this.controller,
      this.hasPrefix = false,
      this.prefix})
      : super(key: key);

  final String tileName;
  final String tileIcon;
  final bool isPassword;
  final void Function(String)? onChange;
  final TextInputType? inputType;
  final String Function(String?)? validator;
  final TextEditingController controller;
  final bool hasPrefix;
  final String? prefix;

  @override
  _TextInputTileState createState() => _TextInputTileState();
}

class _TextInputTileState extends State<TextInputTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 100.w - 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 0),
                  //   child: Text(
                  //     widget.tileName,
                  //     style: const TextStyle(
                  //         fontFamily: 'ProductSans',
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.normal,
                  //         color: darkAshVariantLighter),
                  //   ),
                  // ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 220,
                    height: 30,
                    child: TextFormField(
                      controller: widget.controller,
                      obscureText: widget.isPassword,
                      validator: widget.validator,
                      onChanged: widget.onChange,
                      keyboardType: widget.inputType,
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: widget.tileName,
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          )),
                      // decoration: const InputDecoration(
                      //   // enabledBorder: UnderlineInputBorder(
                      //   //   borderSide: BorderSide(
                      //   //     color: Colors.grey,
                      //   //   ),
                      //   // ),
                      //   // focusedBorder: OutlineInputBorder(
                      //   //   borderSide: BorderSide(
                      //   //     color: Colors.grey
                      //   //   )
                      //   //     // borderSide: BorderSide(
                      //   //     //   color: Colors.black.withOpacity(0.38),
                      //   //     // ),
                      //   //     // borderRadius: BorderRadius.circular(7),
                      //   // ),
                      //   border: InputBorder.none,
                      // ),
                      style: TextStyle(
                          // fontFamily: 'ProductSans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: primaryBlackVariantLighter),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
