import 'package:flutter/material.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text, this.color});
  final void Function()? onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(kOrange.value),
        width: width,
        height: height*0.065,
        child: Center(
          child: ReusableText(text: text,
              style: appStyle(16, color??Color(kLight.value), FontWeight.w600)
          ),
        ),
      ),
    );
  }
}
