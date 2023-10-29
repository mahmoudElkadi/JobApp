import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';

import '../../../../../core/utils/constants.dart';

class JobHorizontalTile extends StatelessWidget {
  final Function() onTap;
  final String text;
  const JobHorizontalTile({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          width: width*0.7,
          height: MediaQuery.of(context).size.height*0.1,
          color: Color(kLightGrey.value),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Facebook.png'),
                  ),
                  const WidthSpacer(width: 15),
                  
                  ReusableText(
                      text: text,
                      style: appStyle(20, Color(kDark.value), FontWeight.w600)
                  )
                ],
              ),
              const HeightSpacer(size: 20),
              ReusableText(text: "Java Backend Developer",
                  style: appStyle(18, Color(kDark.value), FontWeight.w700)
              ),
              const HeightSpacer(size: 7),
              Text("New York (Remote)",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16,color: Color(kDarkGrey.value)),
              ),
              const HeightSpacer(size: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(text: "15K",
                          style: appStyle(23, Color(kDark.value), FontWeight.w500)
                      ),
                      ReusableText(text: "/monthly",
                          style: appStyle(23, Color(kDarkGrey.value), FontWeight.w500)
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(Ionicons.chevron_forward),
                  )
                  
                ],
              )


            ],
          ),
          

        ),
      ),

    );
  }
}
