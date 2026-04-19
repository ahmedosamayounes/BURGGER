import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/home/data/models/categories/categories_model.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final List<CategoryData?> categories;
  CategoriesList({super.key, required this.categories});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
    var categoiresListIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  categoiresListIndex = index;
                });
              },
            
              label: Text(
                widget.categories[index]?.name ?? '' ,

                style: TextStyle(fontSize: 16),
              ),
            
              style: TextButton.styleFrom(
                backgroundColor: categoiresListIndex == index ? AppColors.categorieColor : AppColors.categorieColor2,
                foregroundColor: AppColors.lightGreenColor,
            
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            
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
