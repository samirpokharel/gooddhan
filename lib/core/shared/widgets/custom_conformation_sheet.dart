import 'package:flutter/material.dart';

class ConformationSheet extends StatelessWidget {
  final void Function()? onYes;
  final void Function()? onNo;
  final String leadTitle;
  final String summary;

  const ConformationSheet(
      {Key? key,
      required this.leadTitle,
      required this.summary,
      this.onYes,
      this.onNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.all(16),
      height: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 35,
            color: primaryColor.withOpacity(.2),
          ),
          const SizedBox(height: 16),
          Text(leadTitle, style: textTheme.headline2?.copyWith(fontSize: 18)),
          const SizedBox(height: 16),
          Text(summary, style: textTheme.bodyText2),
          const SizedBox(height: 16 * 2),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 56,
                  color: primaryColor.withOpacity(.2),
                  child: Text(
                    "No",
                    style: textTheme.bodyText1?.copyWith(color: primaryColor),
                  ),
                  onPressed: onNo ?? () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 56,
                  color: primaryColor,
                  child: Text(
                    "Yes",
                    style: textTheme.bodyText1?.copyWith(color: Colors.white),
                  ),
                  onPressed: onYes,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
