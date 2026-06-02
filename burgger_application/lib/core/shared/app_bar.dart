import '../helpers/extensions.dart';
import 'app_logo.dart';
import '../theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.iconAction, this.onTap, this.leading});
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
              padding:  EdgeInsets.only(right: 32.0.r),
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
