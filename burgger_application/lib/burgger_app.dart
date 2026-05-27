import 'package:burgger_application/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes_string.dart';
import 'core/theming/app_colors.dart';

class BurggerApp extends StatelessWidget {
  final AppRouter appRouter;

  const BurggerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BurggerApp',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        initialRoute: isLoggedInUser ? RoutesString.root : RoutesString.login,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
