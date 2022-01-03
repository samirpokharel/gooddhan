import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/core/shared/widgets/custom_conformation_sheet.dart';
import 'package:gooddhan/core/shared/widgets/custom_profile_card.dart';
import 'package:gooddhan/core/shared/widgets/custom_profile_menu_card.dart';
import 'package:gooddhan/dashboard/profile/application/profile_notifier.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ref.read(profileNotifierProvider.notifier).loadUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = Theme.of(context).appBarTheme.backgroundColor;
    final profileNotifier = ref.watch(profileNotifierProvider.notifier);
    final profileState = ref.watch(profileNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16 * 4),
            profileState.maybeMap(
              success: (success) => AcountProfileCard(user: success.user),
              orElse: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 16 * 2),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [getBoxShadow(context)],
              ),
              child: Column(
                children: [
                  ProfileMenuCard(
                    color: Colors.amberAccent,
                    icon: AppIcon.user,
                    onPressed: () {},
                    title: "Account",
                  ),
                  const Divider(),
                  ProfileMenuCard(
                    color: Theme.of(context).primaryColor,
                    icon: AppIcon.settings,
                    onPressed: () {},
                    title: "Settings",
                  ),
                  const Divider(thickness: .7),
                  ProfileMenuCard(
                    color: Colors.cyan,
                    icon: Icons.category,
                    title: "Category",
                    onPressed: () {},
                  ),
                  const Divider(thickness: .7),
                  ProfileMenuCard(
                    color: Colors.red,
                    icon: AppIcon.logout,
                    title: "Logout",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ConformationSheet(
                            leadTitle: "Logout ?",
                            summary: "Are you sure do you wanna logout?",
                            onYes: () {
                              profileNotifier.logout();
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

BoxShadow getBoxShadow(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return BoxShadow(
      color: Colors.grey.shade900,
      offset: const Offset(-3, -6),
      blurRadius: 24,
    );
  }
  return const BoxShadow(
    color: Color.fromRGBO(208, 208, 208, 0.25),
    offset: Offset(-3, -6),
    blurRadius: 24,
  );
}
