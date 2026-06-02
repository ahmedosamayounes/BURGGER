import 'core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes_string.dart';
import 'core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller = PageController();
  final AppRouter _appRouter = AppRouter(); // نأخذ نسخة من الراوتر بتاعك

  late List<Widget> screens;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // الحل السحري: هنخلي الراوتر يولد لنا الشاشات كأننا بنعمل Navigator بالظبط
    controller = PageController(initialPage: currentIndex);

    screens = [
      _buildScreenFromRoute(RoutesString.home),
      _buildScreenFromRoute(RoutesString.cart),
      _buildScreenFromRoute(RoutesString.orderHistory),
            _buildScreenFromRoute(RoutesString.profile),

    ];
  }

  // ميثود صغيرة بتحول الـ String لـ Widget باستخدام الـ Logic بتاعك في الـ generateRoute
  Widget _buildScreenFromRoute(String routeName) {
    final route = _appRouter.generateRoute(RouteSettings(name: routeName));
    if (route is MaterialPageRoute) {
      // الـ builder هو اللي جواه الـ MultiBlocProvider والشاشة
      return route.builder(context);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens, // كدة كل شاشة دخلت بـ الـ Providers بتاعتها
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: BottomNavigationBar(

          currentIndex: currentIndex,
          selectedFontSize: 12.sp,    
  unselectedFontSize: 11.sp,
  iconSize: 24.sp,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey.shade500,
          selectedLabelStyle: AppTextStyle.font14WhiteColorExtraBold,
          unselectedLabelStyle: AppTextStyle.font14WhiteColorMedium,
    
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            controller.animateToPage(
    index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
      
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_pie),
              label: 'Order Hisotry ',
            ),
                BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
