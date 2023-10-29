import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';

import '../../../../../core/utils/constants.dart';

class SearchWidget extends StatelessWidget {
final Function() ontap;
  const SearchWidget({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:  Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width*0.78,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Feather.search,
                    color: Color(kOrange.value),
                      size: 20.h,
                    ),
                    const WidthSpacer(width: 20),
                    ReusableText(text: 'Search for jobs',
                        style: appStyle(18, Color(kOrange.value), FontWeight.w500)
                    ),
                  ],
                ) ,
              ),
              Icon(FontAwesome.sliders,
              color: Color(kDarkGrey.value),
                size: 20.h,
              ),
            ],
          ),
          const HeightSpacer(size: 7),
          Divider(
            color:Color(kDarkGrey.value) ,
            thickness: 0.5,
            endIndent: 40.w,

          )
        ],
      ),

    );
  }
}
