import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gooddhan/core/shared/widgets/custom_check_box.dart';
import 'package:gooddhan/currency/domain/currency.dart';

Future<Currency?> showCurrencyPicker({
  required BuildContext context,
  Currency? initialCurrency,
  bool rootNavigator = true,
}) async {
  final currency = await Navigator.of(context).push<Currency>(
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (_) => CurrencyPicker(
        initialCurrency: initialCurrency,
      ),
    ),
  );
  return currency;
}

class CurrencyPicker extends StatefulWidget {
  final Currency? initialCurrency;
  const CurrencyPicker({
    Key? key,
    this.initialCurrency,
  }) : super(key: key);

  @override
  State<CurrencyPicker> createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<CurrencyPicker> {
  List<Currency> searchtedCurrency = [];
  Currency? selectedCurrency;

  @override
  void initState() {
    searchtedCurrency = search("");
    if (widget.initialCurrency != null) {
      selectedCurrency = widget.initialCurrency!;
    }
    super.initState();
  }

  void onTermChange(String text) {
    setState(() => searchtedCurrency = search(text));
  }

  List<Currency> search(String text) {
    return currencies.where((currency) {
      return currency.name.toLowerCase().contains(text) ||
          currency.pluralName.toLowerCase().contains(text) ||
          currency.flag.toLowerCase().contains(text) ||
          currency.code.toLowerCase().contains(text);
    }).toList();
  }

  void selectCurrency(Currency currency) {
    if (currency != selectedCurrency) {
      setState(() => selectedCurrency = currency);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                onChanged: onTermChange,
                decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: "Search...",
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(60),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context, selectedCurrency);
            },
          ),
          title: const Text("Select Currency"),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.check_mark),
              onPressed: () {
                Navigator.pop(context, selectedCurrency);
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: searchtedCurrency.length,
          padding: const EdgeInsets.all(22),
          itemBuilder: (context, index) {
            final currency = searchtedCurrency[index];
            return ListTile(
              leading: Text(
                currencyToEmoji(currency),
                style: const TextStyle(fontSize: 25),
              ),
              title: Text(
                currency.pluralName,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "${currency.name} (${currency.symbol})",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              trailing: CustomCheckBox(
                value: currency == selectedCurrency,
                onChanged: (val) {
                  selectCurrency(currency);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  String currencyToEmoji(Currency? currency) {
    final String currencyFlag = currency!.flag;
    final int firstLetter = currencyFlag.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = currencyFlag.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}
