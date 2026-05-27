import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    // نداء الدالة أول ما الـ Widget يدخل الشاشة عشان يقرأ الاسم الفريش من الـ SharedPref
    context.read<CategoriesCubit>().getUserName();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Morning, ${context.read<CategoriesCubit>().userName ?? 'User'}'
                  .toUpperCase(),
              maxLines: 1,
            
              style: AppTextStyle.font30WhitelightColorExtraBold,
            ),
            Gap(5),
            Text(
              'Experience the art of the perfect flame-grilled burger.',
              style: AppTextStyle.font14TextColorMedium,
            ),
          ],
        );
      },
    );
  }
}
