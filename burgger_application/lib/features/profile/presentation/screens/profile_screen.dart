import '../../../../core/shared/app_bar.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../cubit/cubit_get_data/profile_cubit.dart';
import '../cubit/cubit_get_data/profile_state.dart';
import '../cubit/cubit_update_data/profile_update_cubit.dart';
import '../widgets/profile_form.dart';
import '../widgets/profile_update_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),

      body: SafeArea(
        child: MultiBlocListener(
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
                          size: 50.sp,
                        ),

                        Gap(10.h),

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
                  final user = data;
                  final updateCubit = context.read<ProfileUpdateCubit>();
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 20.w,
                    ),

                    child: SingleChildScrollView(
                      child: ProfileForm(user: user, updateCubit: updateCubit),
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
