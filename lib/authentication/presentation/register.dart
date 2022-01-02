import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
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
  Currency? selectedCurrency;

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
    final currency = await showCurrencyPicker(context: context);
    setState(() {
      selectedCurrency = currency;
    });
  }

  void _createAccount() {
    //create account
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    onTap: () => selectedCurrency,
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
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: StateButton(
                  //     buttonStatus: ButtonStatus.idle,
                  //     text: "Continue",
                  //     onPressed: () {
                  //       if (_monthlyIncomeController.text.isNotEmpty) {
                  //         _createAccount();
                  //       }
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
