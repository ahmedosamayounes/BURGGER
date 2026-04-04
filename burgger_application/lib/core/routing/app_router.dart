import 'package:burgger_application/core/di/depnedency_injaction.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/features/home/ui/home_screen.dart';
import 'package:burgger_application/features/login/data/repo/login_repo.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/login/ui/login_screen.dart';
import 'package:burgger_application/features/signup/data/repo/signup_repo.dart';
import 'package:burgger_application/features/signup/logic/cubit/signup_cubit.dart';
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
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case RoutesString.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: BlocProvider(
              create: (context) => getIt<SignupCubit>(),
              child: RegisterScreen(),
            ),
          ),
        );

              case RoutesString.home:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: HomeScreen(),
          ),
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
