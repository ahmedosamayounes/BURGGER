import 'package:burgger_application/core/shared/app_bar.dart';
import 'package:burgger_application/core/shared/app_button.dart';
import 'package:burgger_application/core/shared/app_text_form_field.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/profile/logic/cubit_get_data/profile_cubit.dart';
import 'package:burgger_application/features/profile/logic/cubit_get_data/profile_state.dart';
import 'package:burgger_application/features/profile/logic/cubit_update_data/profile_update_cubit.dart';
import 'package:burgger_application/features/profile/ui/widgets/profile_update_bloc_listener.dart';
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
                appBar: AppBarr( leading: Icon(Icons.arrow_back, color: AppColors.primaryColor,)),

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
                profileSuccess: (data) {
                  final user = data.data;
                  final updateCubit = context.read<ProfileUpdateCubit>();
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
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
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 70,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Gap(30),

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
