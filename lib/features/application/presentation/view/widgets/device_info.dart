import 'package:flutter/cupertino.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:jobchat/core/widgets/custom_outline_btn.dart';
import 'package:jobchat/core/widgets/height_spacer.dart';
import 'package:jobchat/core/widgets/reusable_text.dart';

import '../../../../../core/utils/app_style.dart';

class DeviceInfo extends StatelessWidget {
  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAddress;

  const DeviceInfo({super.key, required this.location, required this.device, required this.platform, required this.date, required this.ipAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
            text: platform,
            style: appStyle(22,Color(kDark.value),FontWeight.bold),
        ),
        ReusableText(
            text: device,
            style: appStyle(22,Color(kDark.value),FontWeight.bold),
        ),
        HeightSpacer(size: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: date,
                  style: appStyle(16,Color(kDarkGrey.value),FontWeight.w400),
                ),
                ReusableText(
                  text: ipAddress,
                  style: appStyle(16,Color(kDarkGrey.value),FontWeight.w400),
                ),
              ],
            ),
            CustomOutlineBtn(
                width: width*0.3,
                height: height*0.05,
                text: "Sign Out",
                color: Color(kOrange.value),
            ),
          ],
        )
      ],
    );
  }
}
