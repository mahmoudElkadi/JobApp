import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/features/application/presentation/view/widgets/application_view_body.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';

import '../../../../core/widgets/drawer_widgets.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});

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
          text: "Application",

        ),
      ),
      body: const SafeArea(
        child:ApplicationViewBody() ,
      ),

    );
  }
}
