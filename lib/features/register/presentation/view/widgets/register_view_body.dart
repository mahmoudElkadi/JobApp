import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/custom_text_field.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../login/presentation/view/login_view.dart';
import '../../manger/register cubit/register_cubit.dart';
import '../../manger/register cubit/register_state.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocBuilder<RegisterCubit,RegisterState>(
        builder: (context,state){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                const HeightSpacer(size: 50),
                ReusableText(text: "Hello, Welcome!",
                    style: appStyle(30, Color(kDark.value), FontWeight.w600)),
                ReusableText(text: "Fill the details to Register to your account",
                    style: appStyle(16, Color(kDarkGrey.value), FontWeight.w600)),
                const HeightSpacer(size: 50),
                CustomTextField(
                    controller: RegisterCubit.get(context).email,
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
                    controller: RegisterCubit.get(context).name,
                    hintText: "Name",
                    keyboardType: TextInputType.name,
                  validator: (Name){
                      if(Name!.isEmpty){
                        return "Please enter Your Name";
                      }else{
                        return null;
                      }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: RegisterCubit.get(context).password,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: RegisterCubit.get(context).obscureText,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      RegisterCubit.get(context).obscureText=!RegisterCubit.get(context).obscureText;
                    },
                    child:RegisterCubit.get(context).obscureText==false ? const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                  ),
                  validator: (password){
                   if(RegisterCubit.get(context).passwordValidator(password??'')){
                     return "please enter a valid password with at least one upper case ,one lower case ,one digit,special character and length 8 ";
                   }
                   return null;
                  },
                ),
                const HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>const LoginView());
                    },
                    child: ReusableText(
                      text: "Login",
                      style: appStyle(14, Color(kDark.value), FontWeight.w500),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: "Sign Up",
                  onTap: (){
                    Get.to(()=>const LoginView());
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
