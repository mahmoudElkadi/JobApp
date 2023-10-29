import 'package:flutter/material.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText, required this.keyboardType, this.validator, this.suffixIcon, this.obscureText, this.color, this.hintColor});
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? color;
  final Color? hintColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText??false,
        decoration: InputDecoration(
            filled: true,
         fillColor: color??Color(kLightGrey.value),
          hintText:hintText,
          suffixIcon:suffixIcon,
          hintStyle: appStyle(14,hintColor??Color(kDarkGrey.value), FontWeight.w500),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:Colors.red,width: 0.5 ),
            borderRadius: BorderRadius.zero
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:Colors.transparent,width: 0 ),
            borderRadius: BorderRadius.zero
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color:Colors.red,width: 0.5 ),
            borderRadius: BorderRadius.zero
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(kDarkGrey.value),width: 0.5 ),
            borderRadius: BorderRadius.zero
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 0.5 ),
            borderRadius: BorderRadius.zero
          ),
          border: InputBorder.none
        ),
        controller:controller ,
        cursorHeight: 25,
        style: appStyle(14, Color(kLight.value ), FontWeight.w500),
        validator: validator,
        

      ),
    );
  }
}
