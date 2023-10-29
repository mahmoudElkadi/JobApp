import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobchat/features/login/presentation/view/widgets/custom_appbar.dart';
import 'package:jobchat/features/login/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child:CustomAppBar(
          text: 'Login',
          action: const [

          ],
            leading: GestureDetector(
              onTap:(){
                Get.back();
              },
            child: const Icon(CupertinoIcons.arrow_left),
          )
      ),
      ),
      body: const LoginViewBody(),
    );
  }
}
