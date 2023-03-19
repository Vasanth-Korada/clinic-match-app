import 'package:clinic_match_app/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  @observable
  int bottomNavIndex = 0;

  @observable
  PageController pageController;

  _DashboardStore({int index = 0})
      : bottomNavIndex = index,
        pageController = PageController(initialPage: index);

  @action
  void switchPage(DashboardTab tab) {
    bottomNavIndex = tab.index;
    pageController.animateToPage(
      bottomNavIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void dispose() {
    pageController.dispose();
  }
}
