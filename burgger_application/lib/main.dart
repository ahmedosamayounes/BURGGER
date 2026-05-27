// ignore_for_file: strict_top_level_inference

import 'package:burgger_application/core/helpers/constants.dart';
import 'package:burgger_application/core/helpers/extensions.dart';
import 'package:burgger_application/core/helpers/shared_pref_helper.dart';

import 'burgger_app.dart';
import 'core/di/depnedency_injaction.dart';
import 'core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(BurggerApp(appRouter: AppRouter()));
}
//s
checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
