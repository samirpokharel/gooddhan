import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/presentation/expenses_page.dart';
import 'package:gooddhan/dashboard/profile/presentation/profile_page.dart';
import 'package:gooddhan/dashboard/report/presentation/report_page.dart';
import 'package:gooddhan/settings/presentation/setting_page.dart';

import 'application/bottom_nav_bar_notifier.dart';

enum BottomNavItem { home, expenses, settings, profile }

final Map<BottomNavItem, List<IconData>> _items = {
  BottomNavItem.home: [AppIcon.homeOutline, AppIcon.home],
  BottomNavItem.expenses: [AppIcon.expencesOutline, AppIcon.expences],
  // BottomNavItem.report: [AppIcon.reportOutline, AppIcon.report],
  BottomNavItem.settings: [AppIcon.settings, AppIcon.settings],
  BottomNavItem.profile: [AppIcon.userOutline, AppIcon.user],
};
final Map<BottomNavItem, Widget> _screens = {
  BottomNavItem.home: const ReportPage(),
  BottomNavItem.expenses: const ExpensesPage(),
  BottomNavItem.settings: const SettingPage(),
  BottomNavItem.profile: const ProfilePage(),
};

Map<String, BottomNavigationBarItem> _displayBottomNavItem() {
  return _items.map(
    (item, icons) => MapEntry(
      item.toString(),
      BottomNavigationBarItem(
        icon: Icon(icons[0], size: 20),
        activeIcon: Icon(icons[1], size: 20),
        label: item.name,
      ),
    ),
  );
}

class NavigationPage extends ConsumerWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bootomNavController = ref.watch(bottomNavProvider.notifier);
    final bootomNavState = ref.watch(bottomNavProvider);
    int _currentIndex = _screens.keys.toList().indexOf(bootomNavState);
    return Scaffold(
      body: _screens[bootomNavState],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => bootomNavController
            .updateSelectedItem(_items.keys.toList().elementAt(index)),
        items: _displayBottomNavItem().values.toList(),
      ),
    );
  }
}
