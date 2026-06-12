import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes_string.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit_update_data/profile_update_cubit.dart';
import '../../logic/cubit_update_data/profile_update_state.dart';

class ProfileUpdateBlocListener
    extends BlocListener<ProfileUpdateCubit, ProfileUpdateState> {
  ProfileUpdateBlocListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
            success: (signupResponse) {
              context.pop();
              _showSuccessDialog(context);
            },
            error: (error) {
              _setupErrorState(context, error);
            },
          );
        },
      );

  static void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Data Successful'),
          content: const Text(
            'Congratulations, you have changed your information successfully!',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // close Success Dialog
                context.pop();

                // remove Stack and go to root home
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesString.root,
                  (route) => false,
                );
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  static void _setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,

      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: AppTextStyle.font14BalackColorBold),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Got it', style: AppTextStyle.font14BalackColorBold),
          ),
        ],
      ),
    );
  }
}
