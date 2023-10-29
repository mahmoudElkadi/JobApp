import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/core/widgets/width_spacer.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_cubit.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_state.dart';
import '../../../../../core/utils/app_style.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({super.key, required this.indexSetter});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ZoomCubit(),
      child: BlocBuilder<ZoomCubit,ZoomState>(
        builder: (BuildContext context, ZoomState state) {
          return GestureDetector(
            onDoubleTap: (){
              ZoomDrawer.of(context)!.toggle();
            },
            child: Scaffold(
              backgroundColor: Color(kLightBlue.value),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerItem(
                      AntDesign.home,
                      "Home",
                      0
                  ),
                  drawerItem(
                      Ionicons.chatbubble_outline ,
                      "Chat",
                      1
                  ),
                  drawerItem(
                      Fontisto.bookmark,
                      "Bookmarks",
                      2
                  ),
                  drawerItem(
                      MaterialCommunityIcons.devices,
                      "Application",
                      3

                  ),
                  drawerItem(
                      FontAwesome5Regular.user_circle,
                      "Profile",
                      4
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }

  Widget drawerItem(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.indexSetter(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 40.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: ZoomCubit.get(context).currentIndex == index
                  ? Color(kLight.value)
                  : Color(kLightGrey.value),
            ),
            const WidthSpacer(
              width: 12,
            ),
            ReusableText(
                text: text, style: appStyle(12,
                ZoomCubit.get(context).currentIndex == index
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
                FontWeight.bold))
          ],
        ),
      ),
    );
  }

}
