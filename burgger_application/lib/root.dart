import 'package:burgger_application/core/routing/app_router.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  RootScreen({super.key});

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
        controller: controller,
        children: screens, // كدة كل شاشة دخلت بـ الـ Providers بتاعتها
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.whitelightColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.darkGreenColor,
          unselectedItemColor: Colors.grey.shade500,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            controller.jumpToPage(index);
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
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
