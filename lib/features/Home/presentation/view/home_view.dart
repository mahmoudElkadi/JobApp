import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/widgets/drawer_widgets.dart';
import 'package:jobchat/features/Home/presentation/view/widgets/home_view_body.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: DrawerWidget(),
          ),
          action: [
            Padding(padding: EdgeInsets.all(12.h),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            )
          ],
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: HomeViewBody(),
        ),
      ),


    );
  }
}
