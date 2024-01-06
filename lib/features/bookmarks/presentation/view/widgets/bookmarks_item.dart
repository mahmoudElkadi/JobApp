import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';
import 'package:jobchat/features/Home/data/models/job.dart';
import 'package:jobchat/features/job%20page/presentation/view/job_page_view.dart';

import '../../../../../core/utils/constants.dart';

class AllJobsItem extends StatelessWidget {
  const AllJobsItem({super.key, required this.jobModel});
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Get.to(()=>JobPageView(jobModel: jobModel));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
        height: height*0.15,
        width:width,
        color: Color(kLightGrey.value),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     CircleAvatar(
                      radius: 29,
                      backgroundImage: NetworkImage(jobModel.imageUrl),
                    ),
                    const WidthSpacer(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(text: jobModel.company,
                            style: appStyle(20, Color(kDark.value), FontWeight.w500)
                        ),
                        SizedBox(
                          width: width*0.5,
                          child: ReusableText(text: jobModel.title,
                              style: appStyle(18, Color(kDarkGrey.value), FontWeight.w500)
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                CircleAvatar(
                  radius: 18,
                  child: Icon(Ionicons.chevron_forward,
                    color: Color(kOrange.value),
                  ),

                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 68.w,top: 15.h),
              child: Row(
                children: [
                  ReusableText(text: jobModel.salary,
                      style: appStyle(22, Color(kDark.value), FontWeight.w500)
                  ),
                  ReusableText(text: "/${jobModel.period}",
                      style: appStyle(20, Color(kDarkGrey.value), FontWeight.w500)
                  ),
                ],
              ),
            )

          ],
        ) ,

      ),
    );
  }
}
