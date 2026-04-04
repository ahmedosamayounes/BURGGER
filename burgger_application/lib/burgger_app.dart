import 'package:burgger_application/core/routing/app_router.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BurggerApp extends StatelessWidget {
  final AppRouter appRouter;

  const BurggerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BurggerApp',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        initialRoute: RoutesString.register,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
