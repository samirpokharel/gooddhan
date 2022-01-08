import 'package:flutter_riverpod/flutter_riverpod.dart';

enum BottomNavItem { home, expenses, profile }

final bottomNavProvider =
    StateNotifierProvider.autoDispose<NavigationController, BottomNavItem>(
        (ref) => NavigationController());

class NavigationController extends StateNotifier<BottomNavItem> {
  NavigationController() : super(BottomNavItem.home);

  void updateSelectedItem(BottomNavItem item) {
    if (item != state) {
      state = item;
    }
  }
}
