import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobchat/core/utils/app_style.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';
import 'package:jobchat/features/onboarding/presentation/manger/onboarding%20cubit/on_boarding_cubit.dart';
import 'package:jobchat/features/onboarding/presentation/manger/onboarding%20cubit/on_boarding_state.dart';
import 'package:jobchat/features/onboarding/presentation/view/widgets/page_one.dart';
import 'package:jobchat/features/onboarding/presentation/view/widgets/page_three.dart';
import 'package:jobchat/features/onboarding/presentation/view/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody ({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController pageController=PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (context)=>OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit,OnBoardingState>(
          listener: (context,state){},
          builder: (BuildContext context, OnBoardingState state) =>
           Stack(
            children: [
              PageView(
                physics:OnBoardingCubit.get(context).isLastPage? NeverScrollableScrollPhysics():AlwaysScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (page){
                  OnBoardingCubit.get(context).isLastPage=page==2;
                },
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                ],
              ),

              Positioned(
                  bottom: height*0.08,
                  left: 0,
                  right: 0,

                  child:OnBoardingCubit.get(context).isLastPage?const SizedBox.shrink():
                  Center(
                    child: SmoothPageIndicator(
                      controller:pageController ,
                      count:3 ,
                      effect: WormEffect(
                        dotHeight:12 ,
                        dotWidth: 12,
                        spacing: 10,
                        dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                        activeDotColor: Color(kLight.value)
                      ),

                    ),
                  ),
              ),

              Positioned(

                  child:OnBoardingCubit.get(context).isLastPage?const SizedBox.shrink(): Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.w ,vertical:30.h ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              pageController.jumpToPage(2);
                            },
                            child: ReusableText(
                              text: "Skip",
                              style: appStyle(16, Color(kLight.value), FontWeight.w500),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              pageController.nextPage(
                                  duration: const Duration(milliseconds:300 ),
                                  curve: Curves.ease);
                            },
                            child: ReusableText(
                              text: "Next",
                              style: appStyle(16, Color(kLight.value), FontWeight.w500),
                            ),
                          ),
                        ],
                      ) ,
                    ),
                  )  )
            ],
          ),
        ),
      ),
    );
  }
}
