import 'package:burgger_application/burgger_app.dart';
import 'package:burgger_application/core/di/depnedency_injaction.dart';
import 'package:burgger_application/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(BurggerApp(appRouter: AppRouter()));
}
