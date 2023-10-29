import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/features/application/presentation/view/widgets/device_info.dart';
import 'package:jobchat/features/login/presentation/view/login_view.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_cubit.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_state.dart';
import 'package:jobchat/features/onboarding/presentation/manger/onboarding%20cubit/on_boarding_cubit.dart';
import 'package:jobchat/features/onboarding/presentation/manger/onboarding%20cubit/on_boarding_state.dart';
import 'package:jobchat/features/onboarding/presentation/view/on_boarding_view.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/height_spacer.dart';

class ApplicationViewBody extends StatelessWidget {
  const ApplicationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String date =DateTime.now().toString();
    var loginDate=date.substring(0,11);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 50),
              Text("You are logged in into account on these devices",
                style: appStyle(16.sp, Color(kDark.value), FontWeight.normal),
              ),
              const HeightSpacer(size: 50),
              DeviceInfo(
                  location:"Washington DC",
                  device:"MacBook M2",
                  platform:"Apple Webkit",
                  date:loginDate,
                  ipAddress:"10.0.12.000"
              ),
              const HeightSpacer(size: 50),
              DeviceInfo(
                  location:"Alexandria ",
                  device:"Iphone 14",
                  platform:"Apple Webkit",
                  date:loginDate,
                  ipAddress:"10.1.13.000"
              )


            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap:(){
                Get.to(()=>const OnBoardingView());
              } ,
              child: ReusableText(
                  text: "Sign Out of all devices",
                  style: appStyle(16, Color(kOrange.value), FontWeight.w600)
              ),
            ),
          ),
        )
      ],
    )
    ;
  }
}
