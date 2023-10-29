import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jobchat/features/Home/presentation/view/widgets/head_widget.dart';
import 'package:jobchat/features/Home/presentation/view/widgets/search_view.dart';
import 'package:jobchat/features/Home/presentation/view/widgets/search_widget.dart';
import 'package:jobchat/features/Home/presentation/view/widgets/vertical_tile.dart';
import 'package:jobchat/features/job%20page/presentation/view/job_page_view.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/height_spacer.dart';
import 'job_horizontal_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpacer(size: 10),
          Text('Search \nFind & Apply',
            style: appStyle(40.sp, Color(kDark.value), FontWeight.bold),
          ),
          const HeightSpacer(size: 30),
          SearchWidget(
            ontap: () {
              Get.to(()=>const SearchView());
            },
          ),
          const HeightSpacer(size: 20),
          HeadWidgets(
            headText: 'Popular Jobs',
            onTap: (){},
          ),
          const HeightSpacer(size: 20),
          SizedBox(
            height: height*0.28,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index)=>
                JobHorizontalTile(
                  onTap: () {
                    Get.to(()=>const JobPageView(title: 'Facebook',id: "12",));
                  },
                  text: 'Facebook',),
            ),
          ),
          
          const HeightSpacer(size: 20),
          HeadWidgets(
            headText: 'Recently reposted',
            onTap: (){},
          ),
          const HeightSpacer(size: 20),
          const VerticalTile()

        ],
      ),
    );
  }
}
