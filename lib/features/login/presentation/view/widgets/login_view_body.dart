import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/custom_text_field.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
 import 'package:jobchat/features/login/presentation/manger/login%20cubit/Login_cubit.dart';
import 'package:jobchat/features/login/presentation/manger/login%20cubit/Login_state.dart';
import 'package:jobchat/features/main/presentation/view/main_view.dart';
import 'package:jobchat/features/register/presentation/view/register_view.dart';

import '../../../../../core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocBuilder<LoginCubit,LoginState>(
        builder: (context,state){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                const HeightSpacer(size: 50),
                ReusableText(text: "Welcome Back!",
                    style: appStyle(30, Color(kDark.value), FontWeight.w600)),
                ReusableText(text: "Fill the details to login to your account",
                    style: appStyle(16, Color(kDarkGrey.value), FontWeight.w600)),
                const HeightSpacer(size: 50),
                CustomTextField(
                    controller: LoginCubit.get(context).email,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  validator: (email){
                      if(email!.isEmpty||email.contains("@")){
                        return "Please enter valid email";
                      }else{
                        return null;
                      }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: LoginCubit.get(context).password,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: LoginCubit.get(context).obscureText,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      LoginCubit.get(context).obscureText=!LoginCubit.get(context).obscureText;
                    },
                    child:LoginCubit.get(context).obscureText==false ? const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                  ),
                  validator: (password){
                    if(password!.isEmpty||password.length < 7 ){
                      return "Please enter valid password";
                    }else{
                      return null;
                    }
                  },
                ),
                HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>RegisterView());
                    },
                    child: ReusableText(
                      text: "Register",
                      style: appStyle(14, Color(kDark.value), FontWeight.w500),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: "Login",
                  onTap: (){
                    print("asdasasasasasasasas");
                    Get.to(()=>const MainView());
                  },
                )


              ],
            ),
          );
        },

      ),
    );
  }
}
