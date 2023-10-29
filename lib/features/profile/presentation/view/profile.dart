import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';
import '../../../../core/widgets/drawer_widgets.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const CustomAppBar(
          leading: Padding(
            padding: EdgeInsets.all(12.0),
            child: DrawerWidget(),
          ),
          text: "Profile",

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: height*0.12 ,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(

                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child:CachedNetworkImage(
                          width: 80.w,
                          height: 100.h,
                          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH8L6bMGNGn22GQAYaO0tBwUGWw34yxT4MuiQjcSqn-wyd-wwg1rqchpaj2NEN0ihN2s0&usqp=CAU",) ,
                      ),
                      WidthSpacer(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(text: "John Doe",
                              style: appStyle(20.sp, Color(kDark.value), FontWeight.w600)
                          ),
                          Row(
                            children: [
                              Icon(MaterialIcons.location_pin,
                              color: Color(kDarkGrey.value),
                              ),
                              const WidthSpacer(width: 5),
                              ReusableText(text: "Alexandria EG",
                                  style: appStyle(16.sp, Color(kDarkGrey.value), FontWeight.w600)
                              ),

                            ],
                          )

                        ],
                      ),
                    ],
                  ),
                    GestureDetector(
                      onTap: (){},
                      child: Icon(Feather.edit,size: 18,),
                    )

                ],
              ),
            ),
            const HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  color: Color(kLightGrey.value),
                  width: width,
                  height: height*0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10 ),
                        width: 60.w,
                        height: 70.h,
                        color: Color(kLight.value),
                        child: const Icon(FontAwesome5Regular.file_pdf,
                        color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                              text: "Resume from JobHub",
                              style: appStyle(18, Color(kDark.value), FontWeight.w500)
                          ),
                          ReusableText(
                              text: "JobHub Resume ",
                              style: appStyle(16, Color(kDarkGrey.value), FontWeight.w500)
                          ),
                        ],
                      ),
                      WidthSpacer(width: 1),
                    ],
                  ),
                ),
                Positioned(
                    top:2.h ,
                    right: 5.w,
                    child:GestureDetector(
                      onTap: (){},
                      child: ReusableText(
                          text: "Edit ",
                          style: appStyle(16, Color(kOrange.value), FontWeight.w500)
                      ),
                    )
                ),
              ],
            ),
            const HeightSpacer(size:20 ),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: height*0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  text: "mahmoudelkady@gmail.com",
                  style: appStyle(16, Color(kDark.value), FontWeight.w600),
                ),
              ),
            ),
            const HeightSpacer(size:20 ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              width: width,
              height: height*0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/usa.svg',
                        width: 20.w,
                        height: 22.h),
                    const WidthSpacer(width: 15),
                    ReusableText(
                      text: "+20 01094416691",
                      style: appStyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const HeightSpacer(size:20 ),
            Container(
              color: Color(kLightGrey.value),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.all(8.h),
                    child:  ReusableText(
                      text: "Skills",
                      style: appStyle(16, Color(kDark.value), FontWeight.w600),
                    ),
                  ),
                  const HeightSpacer(size: 3),
                  SizedBox(
                    height: height*0.5,
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                      child: ListView.builder(
                        itemCount: skills.length,
                          //physics: NeverScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  width: width,
                                  height: height*0.06,
                                  color: Color(kLight.value),
                                  child: Row(
                                    children: [
                                      ReusableText(
                                        text: skills[index],
                                        style: appStyle(16, Color(kDark.value), FontWeight.normal),
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),
                      )
                    ) ,
                  ),


                ],
              ),
            ),



          ],
        ),
      ),


    );
  }
}
