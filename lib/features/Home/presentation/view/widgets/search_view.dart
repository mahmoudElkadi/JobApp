import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/custom_text_field.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(
          color: Color(kLight.value),
        ),
        title: CustomTextField(
          color: Color(kOrange.value),
            hintColor:Color(kLight.value) ,
            controller: searchController,
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {

                });
              },
              child:  Icon(AntDesign.search1,color: Color(kLight.value),) ,

            ),
            hintText: "Search",
            keyboardType: TextInputType.text
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/optimized_search.png"),
            ReusableText(text: "Start Searching For Jobs",
                style: appStyle(22.sp, Color(kDark.value), FontWeight.bold)
            )
          ],
        ),
      ),
    );
  }
}
