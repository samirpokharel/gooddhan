import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/core/shared/widgets/custom_state_button.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/presentation/category_picker.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/shared/providers.dart';

class CreateExpensePage extends ConsumerStatefulWidget {
  final bool isUpdate;
  final Expense? previousExpense;
  const CreateExpensePage({
    Key? key,
    required this.isUpdate,
    required this.previousExpense,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateExpensePageState();
}

class _CreateExpensePageState extends ConsumerState<CreateExpensePage> {
  late TextEditingController _expenseAmountController;
  late TextEditingController _summaryController;
  Category? _selectedCategory;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    if (widget.isUpdate) {
      final expense = widget.previousExpense!;
      _expenseAmountController = TextEditingController(
        text: expense.amount.toString(),
      );
      _summaryController = TextEditingController(
        text: expense.title,
      );
      _selectedCategory = (expense.category);
    } else {
      _expenseAmountController = TextEditingController();
      _summaryController = TextEditingController();
    }

    super.initState();
  }

  void selectCategory() async {
    final categories = await showCategoryPicker(
      context: context,
      initialCategory: _selectedCategory,
    );
    if (categories != null) {
      setState(() {
        _selectedCategory = categories[0];
      });
    }
  }

  void createOrUpdate() async {
    final notifier = ref.watch(listExpensesNotifierProvider.notifier);

    if (_expenseAmountController.text.isNotEmpty &&
        _selectedCategory != null &&
        _summaryController.text.isNotEmpty) {
      if (widget.isUpdate && widget.previousExpense != null) {
        Navigator.pop(context);
        await notifier.updateExpense(
          categoryId: _selectedCategory!.id,
          amount: num.parse(_expenseAmountController.text.trim()),
          title: _summaryController.text.trim(),
          expenseId: widget.previousExpense!.id,
        );
      } else {
        Navigator.pop(context);
        await notifier.createExpense(
          _selectedCategory!.id,
          num.parse(_expenseAmountController.text),
          _summaryController.text,
        );
      }
    }
  }

  @override
  void dispose() {
    _expenseAmountController.dispose();
    _summaryController.dispose();
    _selectedCategory = null;
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16 * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      AppIcon.arrowLeft,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    widget.isUpdate ? "Update Expense" : "Add Expenses",
                    style: context.headline1,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.isUpdate
                        ? "Update your expence"
                        : "Add your expence",
                    style: context.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  CustomValueTile(
                    onTap: () => selectCategory(),
                    title: "Choose Category",
                    value: "${_selectedCategory != null ? 1 : 0} selected",
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _summaryController,
                    decoration: const InputDecoration(hintText: "Summary"),
                  ),
                  const SizedBox(height: 32),
                  const Text("How much ?"),
                  const SizedBox(height: 16),
                  Theme(
                    data: ThemeData(),
                    child: Row(
                      children: [
                        const Text(
                          "Rs",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _expenseAmountController,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "0.00",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xffA5A5A5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.center,
                    child: CustomStateButton(
                      buttonStatus: ButtonStatus.idle,
                      text: "Continue",
                      onPressed: createOrUpdate,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
