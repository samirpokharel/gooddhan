import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/widgets/custom_check_box.dart';
import 'package:gooddhan/settings/shared/providers.dart';

class UpdateDateFormatPage extends ConsumerStatefulWidget {
  final String initialDate;
  const UpdateDateFormatPage({Key? key, this.initialDate = 'english'})
      : super(key: key);

  @override
  ConsumerState<UpdateDateFormatPage> createState() =>
      _UpdateLanguagePageState();
}

class _UpdateLanguagePageState extends ConsumerState<UpdateDateFormatPage> {
  List<String> supportedDateFormat = ["Nepali", "English"];
  String selectedDateFormat = "English";
  @override
  void initState() {
    selectedDateFormat = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(settingNotiferProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Date Format"),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              notifier.updateDateFormat(selectedDateFormat.toLowerCase());
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
        itemCount: supportedDateFormat.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              if (supportedDateFormat[index] != selectedDateFormat) {
                setState(() {
                  selectedDateFormat = supportedDateFormat[index];
                });
              }
            },
            leading: CustomCheckBox(
              value: selectedDateFormat.toLowerCase() ==
                  supportedDateFormat[index].toLowerCase(),
              onChanged: (val) {
                if (supportedDateFormat[index] != selectedDateFormat) {
                  setState(() {
                    selectedDateFormat = supportedDateFormat[index];
                  });
                }
              },
            ),
            title: Text(supportedDateFormat[index]),
          );
        },
      ),
    );
  }
}
