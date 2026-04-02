import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/features/login/data/repo/login_repo.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/login/ui/login_screen.dart';
import 'package:burgger_application/features/signup/ui/register_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesString.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(LoginRepo(WebService(Dio()))),
            child: const LoginScreen(),
          ),
        );

      case RoutesString.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: RegisterScreen()),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
