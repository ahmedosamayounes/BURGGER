import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes_string.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerLogin extends StatelessWidget {
  const BlocListenerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const  Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(RoutesString.root);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: AppColors.errorColor, size: 32),
        content: Text(error, style: AppTextStyle.font14BalackColorBold),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: AppTextStyle.font14BalackColorBold),
          ),
        ],
      ),
    );
  }
}
