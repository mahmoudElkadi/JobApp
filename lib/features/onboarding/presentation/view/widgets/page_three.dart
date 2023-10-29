import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/features/login/presentation/view/login_view.dart';
import 'package:jobchat/features/register/presentation/view/register_view.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_outline_btn.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Container(
                width: width,
                height:350.h,
                child: Image.asset("assets/images/page3.png",fit: BoxFit.fitWidth,)),
            const HeightSpacer(size: 15),
            ReusableText(text: "Welcome To JobHub",
                style: appStyle(27, Color(kLight.value), FontWeight.w600)
            ),
            const HeightSpacer(size: 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
              child:Text("We help you find your dream job according to your skills, location and preference to build your career",
              textAlign: TextAlign.center,
                style: appStyle(14, Color(kLightGrey.value), FontWeight.normal),
              ) ,
            ),
            HeightSpacer(size: 25.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlineBtn(
                    onTap: (){
                      //final SharedPreferences prefs=await SharedPreferences.getInstance();
                     // await prefs.setBool('entrypoint',true);
                      Get.to(()=>const LoginView());
                    },
                    width:width*0.4 ,
                    height: height*0.06,
                    text: 'Login',
                    color:Color(kLight.value),
                  ),

                  GestureDetector(
                    onTap: (){
                    //  await CacheHelper.putData(key: 'entrypoint', value: true);

                      Get.to(()=>const RegisterView());
                    },
                    child: Container(
                      width:width*0.4 ,
                      height: height*0.06,
                      color: Color(kLight.value),
                      child: Center(
                        child: ReusableText(
                          text: "Sign Up",
                          style: appStyle(16, Color(kLightBlue.value), FontWeight.w600),
                        ),
                      ),

                    ),
                  )
                ],
              ),
            ),
            const HeightSpacer(size: 20),
            ReusableText(text: 'Continue as guest' ,
                style: appStyle(16, Color(kLight.value), FontWeight.w400)
            )
          ],
        ),
      ),
    );
  }
}
