import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/modules/home/home_controller.dart';
import 'package:podcast_app/modules/home/home_view.dart';
import 'package:podcast_app/modules/onboarding/onboarding_controller.dart';
import 'package:podcast_app/base/base_scaffold.dart';
import 'package:podcast_app/shared/constants/strings.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '',
      body: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  _buildPage(controller.podces_image, AppStrings.podcesTitle,
                      AppStrings.podcesSubtitle),
                  _buildPage(controller.podces_image, AppStrings.podcesTitle,
                      AppStrings.podcesSubtitle),
                  GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) => HomeView(),
                  ),
                ],
              ),
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: controller.currentPageIndex.value == index
                          ? 20.w
                          : 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: controller.currentPageIndex.value == index
                            ? const Color.fromRGBO(82, 82, 152, 1)
                            : const Color.fromRGBO(123, 128, 133, 1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    );
                  }),
                )),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                padding: EdgeInsets.all(20.h),
                backgroundColor: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Color.fromRGBO(82, 82, 152, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          child: Image.asset(
            imagePath,
            height: 317.h,
            width: 240.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 42.h),
        Text(
          title,
          style: TextStyle(
            fontFamily: "PoppinsBold",
            fontSize: 36.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "InterRegular",
              fontSize: 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
