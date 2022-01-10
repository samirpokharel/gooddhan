import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/infrastructure/validation_service.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/core/shared/widgets/custom_state_button.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/presentation/category_picker.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
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
  List<Category> _selectedCategories = [];

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
      _selectedCategories = [(expense.category)];
    } else {
      _expenseAmountController = TextEditingController();
      _summaryController = TextEditingController();
    }

    super.initState();
  }

  void selectCategory() async {
    final categories = await showCategoryPicker(
      context: context,
      initialCategories: _selectedCategories,
    );
    if (categories != null) {
      setState(() {
        _selectedCategories = categories;
      });
    }
  }

  void createOrUpdate() async {
    final notifier = ref.watch(listExpensesNotifierProvider.notifier);
    if (_selectedCategories.isEmpty) {
      return showFlashToast(
        context,
        message: "Please Select Cateogry",
        flavouer: ToastFlavouer.error,
        dismissDuration: const Duration(seconds: 3),
      );
    }

    if (_expenseAmountController.text.isNotEmpty &&
        _selectedCategories.isNotEmpty &&
        _summaryController.text.isNotEmpty) {
      if (widget.isUpdate && widget.previousExpense != null) {
        await notifier.updateExpense(
          categoryId: _selectedCategories[0].id,
          amount: num.parse(_expenseAmountController.text.trim()),
          title: _summaryController.text.trim(),
          expenseId: widget.previousExpense!.id,
        );
      } else {
        await notifier.createExpense(
          _selectedCategories[0].id,
          num.parse(_expenseAmountController.text),
          _summaryController.text,
        );
      }
    } else {
      showFlashToast(
        context,
        message: "All fields are required",
        flavouer: ToastFlavouer.error,
        dismissDuration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void dispose() {
    _expenseAmountController.dispose();
    _summaryController.dispose();
    _selectedCategories = [];
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<PaginatedState>(listExpensesNotifierProvider, (_, next) {
      next.maybeWhen(
        failed: (_, failure) {
          showFlashToast(
            context,
            message: failure.message,
            flavouer: ToastFlavouer.error,
            dismissDuration: const Duration(seconds: 3),
          );
        },
        success: (_, __, ___) {
          AutoRouter.of(context).pop();
        },
        orElse: () {},
      );
    });
    return CustomLoadingWraper(
      isLoading: ref.watch(listExpensesNotifierProvider).maybeWhen(
            orElse: () => false,
            loadInProgress: (_, __) => true,
          ),
      child: ClearFocus(
        child: Scaffold(
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
                        value: "${_selectedCategories.length} selected",
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _summaryController,
                        validator: (val) =>
                            ValidationService.notEmpty(val, "Summary"),
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
                                style: context.headline1?.copyWith(
                                  fontSize: 40,
                                ),
                                validator: (val) =>
                                    ValidationService.notEmpty(val, "Amount"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]'),
                                  ),
                                ],
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              createOrUpdate();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
