
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_cubit.dart';
import 'package:jobchat/features/main/presentation/manger/zoom%20cubit/zoom_state.dart';
import 'package:jobchat/features/main/presentation/view/widgets/drawer_screen.dart';

import '../../../Home/presentation/view/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ZoomCubit>(
      create: (context)=>ZoomCubit(),
      child: BlocBuilder<ZoomCubit,ZoomState>(

        builder: (BuildContext context, state) {
          return ZoomDrawer(
              menuScreen: DrawerScreen(
                indexSetter:(index){
                  ZoomCubit.get(context).currentIndex=index;
                },

              ),
              mainScreen: ZoomCubit.get(context).currentScreen(ZoomCubit.get(context).currentIndex),
              borderRadius: 30,
              showShadow: true,
              angle: 0.0,
              slideWidth: 250.w,
              menuBackgroundColor: Color(kLightBlue.value),


          );
        },

      ),
    );

  }
}


