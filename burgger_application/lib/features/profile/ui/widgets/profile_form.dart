import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/shared/app_button.dart';
import '../../../../core/shared/app_text_form_field.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit_update_data/profile_update_cubit.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key, required this.updateCubit, this.user});
  final dynamic user;
  final ProfileUpdateCubit updateCubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: updateCubit.formKey,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: const BoxDecoration(
                color: AppColors.whitelightColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, size: 50.sp, color: Colors.grey[600]),
            ),
          ),
          Gap(24.h),
          AppTextFormField(
            controller: updateCubit.nameController,
            hinttext: user?.name ?? 'name',
            text: 'Name',
            backgroundColor: AppColors.darkGreenColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Name';
              }
            },
          ),
          Gap(10.h),

          AppTextFormField(
            controller: updateCubit.emailController,
            hinttext: user?.email ?? 'email',
            text: 'Email',
            backgroundColor: AppColors.darkGreenColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Email';
              }
            },
          ),
          Gap(10.h),

          AppTextFormField(
            controller: updateCubit.addressController,
            hinttext: user?.address ?? 'address',
            text: 'Delivery address',
            backgroundColor: AppColors.darkGreenColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Address';
              }
            },
          ),
          Gap(10.h),

          AppTextFormField(
            controller: updateCubit.visaController,
            hinttext: user?.visa ?? 'visa',
            text: 'Visa',
            backgroundColor: AppColors.darkGreenColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Visa number';
              }
            },
          ),
          Gap(30.h),
          Center(
            child: AppButton(
              buttonText: 'Update Profile',
              textStyle: AppTextStyle.font18TextColorExtraBold,
              onPressed: () {
                if (updateCubit.formKey.currentState!.validate()) {
                  updateCubit.emitUpdateProfileStates();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
