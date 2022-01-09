import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/navigation/presentation/navigation_page.dart';

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
