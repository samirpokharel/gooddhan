import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/infrastructure/validation_service.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/core/shared/widgets/custom_state_button.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/currency/presentation/currency_picker.dart';
import 'package:gooddhan/dashboard/profile/application/profile_notifier.dart';
import 'package:gooddhan/dashboard/profile/shared/providers.dart';

class UpdateAccountPage extends ConsumerStatefulWidget {
  const UpdateAccountPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UpdateAccountPage> createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends ConsumerState<UpdateAccountPage> {
  TextEditingController _monthlyIncomeController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Currency? selectedCurrency = currencies[0];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      ref.read(profileNotifierProvider.notifier).loadUser();
    }).then(
      (value) {
        ref.read(profileNotifierProvider).maybeWhen(
              success: (user, _) {
                _monthlyIncomeController = TextEditingController(
                  text: user.monthlyIncome.toString(),
                );
                _displayNameController = TextEditingController(
                  text: user.displayName,
                );
                selectedCurrency = Currency.fromCode(
                  user.currency,
                );
                _formKey = GlobalKey<FormState>();
              },
              orElse: () {},
            );
      },
    );
  }

  @override
  void dispose() {
    _monthlyIncomeController.dispose();
    _displayNameController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void pickCurrency() async {
    final currency = await showCurrencyPicker(
      context: context,
      initialCurrency: selectedCurrency,
    );
    setState(() {
      selectedCurrency = currency;
    });
  }

  void _updateAccount() async {
    if (selectedCurrency == null) {
      return showFlashToast(
        context,
        message: "Please Select Currency",
        flavouer: ToastFlavouer.error,
        dismissDuration: const Duration(seconds: 3),
      );
    }
    if (selectedCurrency != null &&
        _monthlyIncomeController.text.isNotEmpty &&
        _displayNameController.text.isNotEmpty) {
      ref.read(profileNotifierProvider.notifier).updateProfile(
            displayName: _displayNameController.text.trim(),
            monthlyIncome: _monthlyIncomeController.text.trim(),
            currency: selectedCurrency!.code,
          );
    } else {
      return showFlashToast(
        context,
        message: "All Field are required",
        flavouer: ToastFlavouer.error,
        dismissDuration: const Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ProfileState>(profileNotifierProvider, (_, next) {
      next.maybeMap(
        failed: (_) {
          showFlashToast(
            context,
            message: _.failure.message,
            dismissDuration: const Duration(seconds: 5),
          );
        },
        success: (_) {
          if (_.profileSuccessType == ProfileSuccessType.updated) {
            showFlashToast(
              context,
              message: "Profile Updated Successfully",
              dismissDuration: const Duration(seconds: 5),
              flavouer: ToastFlavouer.success,
            );
            AutoRouter.of(context).pop();
          }
        },
        orElse: () {},
      );
    });
    return ClearFocus(
      child: Scaffold(
        body: CustomLoadingWraper(
          isLoading: ref.watch(profileNotifierProvider).maybeMap(
                loading: (_) => true,
                orElse: () => false,
              ),
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: CustomLoadingWraper(
                isLoading: false,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 35,
                          ),
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                        ),
                        const SizedBox(height: 32),
                        Text("Update Account", style: context.headline1),
                        const SizedBox(height: 16),
                        Text(
                          "feel the detail to continue the process",
                          style: context.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        const Divider(),
                        TextFormField(
                          controller: _displayNameController,
                          validator: (val) => ValidationService.notEmpty(
                            val,
                            "Display Name",
                          ),
                          decoration: const InputDecoration(
                            labelText: "Display Name",
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomValueTile(
                          onTap: pickCurrency,
                          title: "Currency",
                          value: selectedCurrency?.code,
                        ),
                        const SizedBox(height: 16),
                        Text("monthly income", style: context.bodyText1),
                        const SizedBox(height: 32),
                        Theme(
                          data: ThemeData(),
                          child: Row(
                            children: [
                              Text(
                                "${selectedCurrency?.symbol}",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  validator: (val) =>
                                      ValidationService.notEmpty(
                                    val,
                                    "Monthly Incoome",
                                  ),
                                  controller: _monthlyIncomeController,
                                  style: context.headline1?.copyWith(
                                    fontSize: 40,
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
                            text: "Update",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_monthlyIncomeController.text.isNotEmpty &&
                                    selectedCurrency != null &&
                                    _displayNameController.text.isNotEmpty) {
                                  _updateAccount();
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
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
