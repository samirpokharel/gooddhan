import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/presentation/category_picker.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

final chooseCategoryProvider =
    ChangeNotifierProvider.autoDispose<ChooseCategoryController>((ref) {
  return ChooseCategoryController();
});

class ChooseCategoryController extends ChangeNotifier {
  List<Category> _selectedCategories = [];
  List<Category> get selectedCategories => _selectedCategories;

  void checkCategory(Category category, SelectableType selectableType) {
    if (selectableType == SelectableType.multiple) {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    } else {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        if (_selectedCategories.isEmpty) {
          _selectedCategories.add(category);
        } else {
          _selectedCategories[0] = category;
        }
      }
    }
    notifyListeners();
  }

  void reset() {
    _selectedCategories = [];
    notifyListeners();
  }
}
