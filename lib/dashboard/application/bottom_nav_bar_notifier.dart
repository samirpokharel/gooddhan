import 'package:flutter_riverpod/flutter_riverpod.dart';

enum BottomNavItem { home, expenses, report, profile }

final bottomNavProvider =
    StateNotifierProvider<NavigationController, BottomNavItem>((ref) {
  return NavigationController();
});

class NavigationController extends StateNotifier<BottomNavItem> {
  NavigationController() : super(BottomNavItem.home);

  void updateSelectedItem(BottomNavItem item) {
    if (item != state) {
      state = item;
    }
  }
}
