import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/categories/categories_model.dart';

class CategoriesList extends StatefulWidget {
  final List<CategoryData?> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
    var categoiresListIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(right: 12.0.w),
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  categoiresListIndex = index;
                });
              },
            
              label: Text(
                widget.categories[index]?.name ?? '' ,

                style: TextStyle(fontSize: 16.sp),
              ),
            
              style: TextButton.styleFrom(
                backgroundColor: categoiresListIndex == index ? AppColors.categorieColor : AppColors.categorieColor2,
                foregroundColor: AppColors.lightGreenColor,
            
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 1.h),
            
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          );
        },

        itemCount: widget.categories.length,

        shrinkWrap: true,
      ),
    );
  }
}
