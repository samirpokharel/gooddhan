import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/widgets/custom_state_button.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/currency/presentation/currency_picker.dart';

class RegisterPage extends ConsumerStatefulWidget {
  final String idToken;
  const RegisterPage({Key? key, required this.idToken}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _AuthCreateAccountState();
}

class _AuthCreateAccountState extends ConsumerState<RegisterPage> {
  late TextEditingController _monthlyIncomeController;
  late GlobalKey<FormState> _formKey;
  Currency? selectedCurrency = currencies[0];

  @override
  void initState() {
    _monthlyIncomeController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _monthlyIncomeController.dispose();
    _formKey = GlobalKey<FormState>();
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

  void _createAccount() {
    final notifier = ref.read(authNotifierProvider.notifier);
    notifier.createAccount(
      widget.idToken,
      currency: selectedCurrency!.code,
      monthlyIncome: _monthlyIncomeController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
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
                        context.router.pop();
                      },
                    ),
                    const SizedBox(height: 32),
                    Text("Create Account", style: context.headline1),
                    const SizedBox(height: 16),
                    Text(
                      "feel the detail to continue the process",
                      style: context.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    const Divider(),
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
                              validator: (val) {},
                              controller: _monthlyIncomeController,
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
                        onPressed: () {
                          if (_monthlyIncomeController.text.isNotEmpty &&
                              selectedCurrency != null) {
                            _createAccount();
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
    );
  }
}
