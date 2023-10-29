import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height.h;
    double width=MediaQuery.of(context).size.width.h;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const HeightSpacer(size: 70),
            Padding(
              padding: EdgeInsets.all(8.h),
                child: Container(
                  width: width,
                    height: 350.h,
                    child: Image.asset("assets/images/page2.png",fit: BoxFit.fitWidth))
            ),
            const HeightSpacer(size: 20),

            Column(
              children: [
                Text("stable Yourself \n With your Ability",
                textAlign: TextAlign.center,
                  style: appStyle(25, Color(kLight.value), FontWeight.w500),
                ),
                const HeightSpacer(size: 10),
                Padding(
                    padding: EdgeInsets.all(8.h),
                  child: Text('We help you find your dream job according to your skills, location and preference to build your career',
                  textAlign: TextAlign.center,
                    style: appStyle(14, Color(kLightGrey.value), FontWeight.normal),

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
