import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'modules/onboarding/onboarding_view.dart';
import 'modules/onboarding/onboarding_binding.dart';
import 'modules/home/home_view.dart';
import 'modules/home/home_binding.dart';
import 'modules/player/player_view.dart';
import 'modules/player/player_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/onboarding',
          getPages: [
            GetPage(
                name: '/onboarding',
                page: () => OnboardingView(),
                binding: OnboardingBinding()),
            GetPage(
                name: '/home', page: () => HomeView(), binding: HomeBinding()),
            GetPage(
                name: '/player',
                page: () => PlayerView(),
                binding: PlayerBinding()),
          ],
        );
      },
    );
  }
}
