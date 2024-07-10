import 'package:breathin/utils/app_fonts.dart';
import 'package:breathin/utils/routes/app_routes.dart';
import 'package:breathin/utils/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'utils/services/navigation_service.dart';

class BreathInApp extends StatelessWidget {
  const BreathInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.email: (v) => "This email is invalid.",
        ValidationMessage.required: (v) => "This field is required.",
        ValidationMessage.mustMatch: (v) => "Field does not matches with parent field",
        ValidationMessage.minLength: (v) {
          Map<String, dynamic> data = v as Map<String, dynamic>;
          return "This field should have at-least ${data['requiredLength']} letters";
        },
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            initialRoute: AppRoute.login,
            navigatorKey: NavigationService.navigatorKey,
            title: 'Mooch App',
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme(centerTitle: true),
              textTheme: Typography.englishLike2018.apply(fontFamily: AppFonts.helvetica, fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
      ),
    );
  }
}
