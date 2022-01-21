import 'package:flutter/material.dart';

class CustomLoadingWraper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const CustomLoadingWraper({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color:
                Theme.of(context).appBarTheme.backgroundColor!.withOpacity(.4),
            child: Column(
              children: const [LinearProgressIndicator()],
            ),
          )
      ],
    );
  }
}
