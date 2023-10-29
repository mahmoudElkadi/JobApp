import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/custom_outline_btn.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';


class JobPageView extends StatelessWidget {
  final String title;
  final String id;
  const JobPageView({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: GestureDetector(
              onTap: ()=>Get.back(),
              child: const Icon(Icons.arrow_back),
            ),
            text: title,
            action: const [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Entypo.bookmark),
              )
            ],
          )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              children: [
                  const HeightSpacer(size: 30 ),
                  Container(
                    width: width,
                    height: height*0.27,
                    color: Color(kLightGrey.value),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                        const HeightSpacer(size: 10),
                        ReusableText(text: "Senior Flutter Developer",
                            style: appStyle(22, Color(kDark.value), FontWeight.w600)
                        ),
                        const HeightSpacer(size: 5),
                        ReusableText(text: "New York ",
                            style: appStyle(16, Color(kDarkGrey.value), FontWeight.normal)
                        ),
                        const HeightSpacer(size: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomOutlineBtn(
                                  width: width*0.26,
                                  height: height*0.04,
                                  text: "Full-time",
                                  color: Color(kOrange.value),
                                  color2:Color(kLight.value)
                              ),
                              Row(
                                children: [
                                  ReusableText(text: "10K",
                                      style: appStyle(22, Color(kDark.value), FontWeight.w600)
                                  ),
                                  SizedBox(
                                    width: width*0.2,
                                    child: ReusableText(text: "/monthly",
                                        style: appStyle(16, Color(kDarkGrey.value), FontWeight.w600)
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                        )

                      ],
                    ),
                  ),
                  const HeightSpacer(size: 20),
                  ReusableText(text: "Job Description",
                    style: appStyle(22, Color(kDark.value), FontWeight.w600),

                  ),
                  const HeightSpacer(size: 10),
                  Text(desc,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                    style: appStyle(16, Color(kDarkGrey.value), FontWeight.normal),
                  ),
                  const HeightSpacer(size: 20),
                  ReusableText(text: "Requirement",
                    style: appStyle(22, Color(kDark.value), FontWeight.w600),
                  ),
                  const HeightSpacer(size: 10),
                  SizedBox(
                    height: height*0.6,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: requirements.length,
                        itemBuilder: (context,index){
                          final req = requirements[index];
                          String bullet ="\u2022";
                          return Text("$bullet $req\n",
                            textAlign: TextAlign.start,
                            style: appStyle(16, Color(kDarkGrey.value), FontWeight.normal),
                          );
                        }
                    ),
                  ),
                const HeightSpacer(size: 40),

              ],
            ),
            const HeightSpacer(size: 40),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: CustomOutlineBtn(
                  onTap: (){

                  },
                  width: width,
                  height: height*0.06,
                  text: "${MediaQuery.of(context).size.height.toString()}",
                  color: Color(kLight.value),
                  color2: Color(kOrange.value),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
