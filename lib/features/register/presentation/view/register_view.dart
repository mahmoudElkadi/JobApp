import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobchat/features/register/presentation/view/widgets/register_view_body.dart';
import '../../../login/presentation/view/widgets/custom_appbar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child:CustomAppBar(
          text: 'Sign Up',
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
      body: const RegisterViewBody(),
    );
  }
}
