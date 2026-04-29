import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 3,
      colorOpacity: 0.3,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 178.h,
              left: -40.w,
              child: SvgPicture.asset(Assets.images.bgHeart.path, height: 1.sh * 0.12),
            ),
            Positioned(
              top: 107.h,
              left: 86.w,
              child: SvgPicture.asset(Assets.images.bgHeart.path, height: 1.sh * 0.03),
            ),
            Positioned(
              top: 195.h,
              right: 20.w,
              child: SvgPicture.asset(Assets.images.bgHeart.path, height: 1.sh * 0.07),
            ),
            Positioned(
              top: 80.h,
              right: -41.w,
              child: SvgPicture.asset(Assets.images.bgHeart.path, height: 1.sh * 0.08),
            ),
          ],
        ),
      ),
    );
  }
}
