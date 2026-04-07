import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:burgger_application/features/home/ui/widgets/products/product_deatlies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductsList extends StatelessWidget {
  final List<ProductData?> products;
  const ProductsList({super.key, required this.products});

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          childAspectRatio: 1 / 1.9,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 185,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
      
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      // when i click go to product deatiles
                        Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => ProductDeatlies(product: products[index]!,)
                    ),
                  );
                    },
                    child: Center(
                      child: SizedBox(
                        width: 140,
                        height: 150,
                        child: Image.network(products[index]!.image ?? '' ,),
                      ),
                    ),
                  ),
                  Gap(8),
                  Text(
                    products[index]!.name ?? '',
                    
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      
                    ),
                    maxLines: 2,
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.secoundryColor,
                        size: 12,
                      ),
                      Gap(5),
                      Text(
                        products[index]!.rating ?? '',
                        style: TextStyle(
                          color: AppColors.secoundryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Gap(5),
                      Row(
                        children: [
                          Text(
                            '\$${products[index]!.price.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Gap(40),
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add , color: AppColors.buttonTextColor,),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
