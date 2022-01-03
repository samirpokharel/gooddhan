import 'package:flutter/material.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/core/shared/widgets/custom_profile_avatar.dart';

class AcountProfileCard extends StatelessWidget {
  final User user;
  const AcountProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        ProfileAvatar(imageUrl: user.photoUrl, radius: 35),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.email, style: textTheme.bodyText2),
              const SizedBox(height: 10),
              Text(user.displayName, style: textTheme.headline1),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
