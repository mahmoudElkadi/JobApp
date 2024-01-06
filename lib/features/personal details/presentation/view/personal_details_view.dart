import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/drawer_widgets.dart';
import '../../../login/presentation/view/widgets/custom_appbar.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});

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
          text: "personalDetails",

        ),
      ),
      body: const Center(child: Text('personalDetials'),),


    );
  }
}
