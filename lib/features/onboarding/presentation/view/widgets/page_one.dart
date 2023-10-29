import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kDarkPurble.value),
        child:  Column(
          children: [
            const HeightSpacer(size: 70),
            SizedBox(
              width: width,
                height: 380.h,
                child: Image.asset("assets/images/page1.png",fit: BoxFit.fitWidth)),
            const HeightSpacer(size: 40),
            Column(
              children: [
                ReusableText(
                    text: "Find Your Dream Job", 
                    style: appStyle(
                        27,
                        Color(kLight.value),
                        FontWeight.w500
                    ),
                ),
                const HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Text('We help you find your dream job according to your skills, location and preference to build your career',
                  textAlign: TextAlign.center,
                  style: appStyle(14, Color(kLightGrey.value), FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
