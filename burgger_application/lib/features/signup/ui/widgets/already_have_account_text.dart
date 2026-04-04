import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyle.font16LightGreenReqular,
          ),
          TextSpan(
            text: ' Sign In',
            style: AppTextStyle.font17PrimaryColorBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RoutesString.login);
              },
          ),
        ],
      ),
    );
  }
}
