import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/reusable_text.dart';

class HeadWidgets extends StatelessWidget {
  final String headText;
  final Function() onTap;

  const HeadWidgets({super.key, required this.headText, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(text: headText,
            style: appStyle(20, Color(kDark.value), FontWeight.w700)
        ),
        GestureDetector(
          onTap:onTap,
          child: Text(
            'view all',
            style: appStyle(18, Color(kOrange.value), FontWeight.w500),
          ),
        )
      ],
    );
  }
}
