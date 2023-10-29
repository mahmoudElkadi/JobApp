import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';

import '../../../../core/widgets/drawer_widgets.dart';


class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

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
          text: "Bookmarks",

        ),
      ),
      body: Center(child: Text('Bookmarks'),),


    );
  }
}
