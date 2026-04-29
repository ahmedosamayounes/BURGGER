import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: AppTextStyle.font16LightGreenReqular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppTextStyle.font17PrimaryColorBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RoutesString.register);                
              },
          ),
        ],
      ),
    );
  }
}
