import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/settings/presentation/update_date_format_page.dart';
import 'package:gooddhan/settings/shared/providers.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(settingNotiferProvider);
    final notifier = ref.watch(settingNotiferProvider.notifier);

    final tileColor = Theme.of(context).appBarTheme.backgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "User setting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          CustomValueTile(
            color: tileColor,
            title: "Update Account",
            onTap: () {
              AutoRouter.of(context).push(const UpdateAccountRoute());
            },
          ),
          const SizedBox(height: 30),
          const Text(
            "General setting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          CustomValueTile(
            onTap: () => AutoRouter.of(context).push(
              UpdateLanguageRoute(
                initialLanguage: state.savedLanguage,
              ),
            ),
            color: tileColor,
            title: "Language",
            value: state.savedLanguage,
          ),
          const SizedBox(height: 20),
          CustomValueTile(
            onTap: () {
              AutoRouter.of(context).push(
                UpdateDateFormatRoute(
                  initialDate: state.savedDateFormat,
                ),
              );
            },
            color: tileColor,
            title: "Date",
            value: state.savedDateFormat,
          ),
          const SizedBox(height: 20),
          CustomValueTile(
            color: tileColor,
            title: "Dark Mode",
            trailing: Switch(
              value: state.isDark,
              onChanged: (val) => notifier.updateTheme(
                state.isDark ? ThemeMode.light : ThemeMode.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
