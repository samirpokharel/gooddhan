import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String errorMessage;
  final void Function()? onRefresh;
  final Widget? extraButton;
  const NoData({
    Key? key,
    this.errorMessage = "No data found",
    this.onRefresh,
    this.extraButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/error.png",
          height: 230,
        ),
        const SizedBox(height: 25),
        Text(errorMessage, style: textTheme.headline1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You can",
              style: textTheme.bodyText2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: onRefresh,
              child: const Text("Refresh"),
            ),
            if (extraButton != null) const Text("or"),
            if (extraButton != null) extraButton!
          ],
        ),
      ],
    );
  }
}
