import '../../../core/shared/app_bar.dart';
import '../../../core/shared/app_button.dart';
import '../../../core/shared/app_text_form_field.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/cubit_get_data/profile_cubit.dart';
import '../logic/cubit_get_data/profile_state.dart';
import '../logic/cubit_update_data/profile_update_cubit.dart';
import 'widgets/profile_update_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarr(
          leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),

        body: MultiBlocListener(
          listeners: [ProfileUpdateBlocListener()],

          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                profileLoading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
                profileError: (e) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: AppColors.errorColor,
                          size: 50,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          e,
                          style: AppTextStyle.font16ErrorColorBold,
                          textAlign: TextAlign.center,
                        ),
                        
                      ],
                    ),
                  );
                },
                profileSuccess: (data) {
                  final user = data.data;
                  final updateCubit = context.read<ProfileUpdateCubit>();
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 20.h,
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(65),
                              child: Image.network(
                                user?.image ?? '',
                                width: 110.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      size: 50.sp,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          AppTextFormField(
                            controller: updateCubit.nameController,
                            hinttext: user?.name ?? 'name',
                            text: 'Name',
                            backgroundColor: AppColors.darkGreenColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                            },
                          ),
                          Gap(10),

                          AppTextFormField(
                            controller: updateCubit.emailController,
                            hinttext: user?.email ?? 'email',
                            text: 'Email',
                            backgroundColor: AppColors.darkGreenColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                            },
                          ),
                          Gap(10),

                          AppTextFormField(
                            controller: updateCubit.addressController,
                            hinttext: user?.address ?? 'address',
                            text: 'Delivery address',
                            backgroundColor: AppColors.darkGreenColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                            },
                          ),
                          Gap(10),

                          AppTextFormField(
                            controller: updateCubit.visaController,
                            hinttext: user?.visa ?? 'visa',
                            text: 'Visa',
                            backgroundColor: AppColors.darkGreenColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid name';
                              }
                            },
                          ),
                          Gap(30),
                          Center(
                            child: AppButton(
                              buttonText: 'Update Profile',
                              textStyle: AppTextStyle.font18TextColorReqular,
                              onPressed: () {
                                updateCubit.emitUpdateProfileStates();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.errorColor,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
