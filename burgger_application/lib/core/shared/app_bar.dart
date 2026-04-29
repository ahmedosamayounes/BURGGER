import 'package:burgger_application/core/helpers/extensions.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarr({super.key, this.iconAction, this.onTap, this.leading});
  final Icon? iconAction;
  final Icon? leading;
  final void Function()? onTap;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: leading ?? Icon(Icons.arrow_back, color: AppColors.primaryColor , size: 14.sp,),
      ),
      title: Row(children: [AppLogo(isLowerCaseText: true, sizeText: 24)]),

      actions: [
        if (iconAction != null)
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: CircleAvatar(
                backgroundColor: AppColors.darkGreenColor,
                child: iconAction ?? SizedBox.shrink(),
              ),
            ),
          ),
      ],
    );
  }
}
