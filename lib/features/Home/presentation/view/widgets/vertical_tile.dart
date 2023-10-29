import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 13.h),
        height: height*0.15,
        width: width,
        color: Color(kLightGrey.value),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/slack.png'),
                          radius: 30,
                        ),
                      const WidthSpacer(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: "Slack",
                              style:appStyle(20, Color(kDark.value), FontWeight.w600)
                          ),
                          SizedBox(
                            width: width*0.5,
                            child: ReusableText(
                                text: "Django Developer",
                                style:appStyle(18, Color(kDarkGrey.value), FontWeight.w600)
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(kLight.value),
                        child: const Icon(Ionicons.chevron_forward),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  ReusableText(text: '20k',
                      style:appStyle(23, Color(kDark.value), FontWeight.w600)
                  ),
                  ReusableText(text: '/monthly',
                      style:appStyle(23, Color(kDarkGrey.value), FontWeight.w600)
                  ),
                ],
              ),
            )
          ],
        ),


      ),
    );
  }
}
