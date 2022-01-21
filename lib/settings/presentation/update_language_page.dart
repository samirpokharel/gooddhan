import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_check_box.dart';
import 'package:gooddhan/settings/shared/providers.dart';

class UpdateLanguagePage extends ConsumerStatefulWidget {
  final String initialLanguage;
  const UpdateLanguagePage({Key? key, this.initialLanguage = 'english'})
      : super(key: key);

  @override
  ConsumerState<UpdateLanguagePage> createState() => _UpdateLanguagePageState();
}

class _UpdateLanguagePageState extends ConsumerState<UpdateLanguagePage> {
  List<String> supportedLanguage = ["English"];
  String selectedLanguage = "English";
  @override
  void initState() {
    selectedLanguage = widget.initialLanguage;
    Future.delayed(Duration.zero).then(
      (value) {
        showFlashToast(
          context,
          message: "Currenly This version of application"
              " only support English language ",
          flavouer: ToastFlavouer.warn,
          dismissDuration: const Duration(seconds: 5),
          barrierDismissible: true,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(settingNotiferProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Langauge"),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              notifier.updateLanguage(selectedLanguage.toLowerCase());
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        itemCount: supportedLanguage.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              if (supportedLanguage[index] != selectedLanguage) {
                setState(() {
                  selectedLanguage = supportedLanguage[index];
                });
              }
            },
            leading: CustomCheckBox(
              value: selectedLanguage.toLowerCase() ==
                  supportedLanguage[index].toLowerCase(),
              onChanged: (val) {
                if (supportedLanguage[index] != selectedLanguage) {
                  setState(() {
                    selectedLanguage = supportedLanguage[index];
                  });
                }
              },
            ),
            title: Text(supportedLanguage[index]),
          );
        },
      ),
    );
  }
}
