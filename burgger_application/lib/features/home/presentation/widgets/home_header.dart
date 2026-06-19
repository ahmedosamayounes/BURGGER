import '../cubit/categories/categories_cubit.dart';
import '../cubit/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/styles.dart';


class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getUserName();
  }
  @override
  Widget build(BuildContext context) {
    final categoriesCubit = context.watch<CategoriesCubit>();
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Morning, ${categoriesCubit.userName ?? 'User'}'
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
