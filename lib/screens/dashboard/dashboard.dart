import 'package:clinic_match_app/constants/assets.dart';
import 'package:clinic_match_app/constants/colors.dart';
import 'package:clinic_match_app/constants/strings.dart';
import 'package:clinic_match_app/screens/dashboard/store/dashboard_store.dart';
import 'package:clinic_match_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DashboardTab { home, explore }

class Dashboard extends StatefulWidget {
  static Route route({
    int? bottomNavIndex,
  }) =>
      MaterialPageRoute(
        builder: (_) => Dashboard(
          bottomNavIndex: bottomNavIndex,
        ),
      );

  final int? bottomNavIndex;

  const Dashboard({
    Key? key,
    this.bottomNavIndex,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late DashboardStore _dashboardStore;

  @override
  void initState() {
    super.initState();
    _dashboardStore = DashboardStore(index: widget.bottomNavIndex ?? 0);
  }

  @override
  void dispose() {
    _dashboardStore.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => PageView(
          onPageChanged: (_) {},
          controller: _dashboardStore.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => SnakeNavigationBar.color(
          onTap: (index) => _dashboardStore.switchPage(DashboardTab.values[index]),
          currentIndex: _dashboardStore.bottomNavIndex,
          snakeShape: SnakeShape.indicator.copyWith(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            centered: true,
          ),
          selectedLabelStyle: Theme.of(context).textTheme.caption,
          unselectedLabelStyle: Theme.of(context).textTheme.caption,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          snakeViewColor: Theme.of(context).colorScheme.primary,
          items: [
            _CustomBottomBarItem(
              svgAssetName: Svgs.icMenuHome,
              text: AppStrings.home,
              tab: DashboardTab.home,
              selectedIndex: _dashboardStore.bottomNavIndex,
            ),
            _CustomBottomBarItem(
              svgAssetName: Svgs.icMenuExplore,
              text: AppStrings.search,
              tab: DashboardTab.explore,
              selectedIndex: _dashboardStore.bottomNavIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomBottomBarItem implements BottomNavigationBarItem {
  final String text;
  final String svgAssetName;
  final int selectedIndex;
  final DashboardTab tab;

  bool get isSelected => tab.index == selectedIndex;

  const _CustomBottomBarItem({
    required this.text,
    required this.svgAssetName,
    required this.tab,
    required this.selectedIndex,
  });

  Widget get bottomBarIcon => Column(
        children: [
          const SizedBox(height: 8),
          SvgPicture.asset(
            svgAssetName,
            height: 27,
            width: 27,
            color: isSelected ? AppColors.darkBlue : AppColors.darkCyan,
          ),
          const SizedBox(height: 4),
        ],
      );

  @override
  Widget get icon => bottomBarIcon;

  @override
  String get label => text;

  @override
  Widget get activeIcon => icon;

  @override
  Color? get backgroundColor => null;

  @override
  String? get tooltip => null;
}
