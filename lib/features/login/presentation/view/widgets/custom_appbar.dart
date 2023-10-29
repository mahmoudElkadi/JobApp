import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, this.leading, this.action});
  final String? text;
  final Widget? leading;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: Color(kLight.value),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: leading,
      actions: action,
      centerTitle: true,
      title:ReusableText(text:text??"" , style: appStyle(16, Color(kDark.value), FontWeight.w600)) ,


    );
  }
}
