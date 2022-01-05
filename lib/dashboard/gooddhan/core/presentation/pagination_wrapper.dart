import 'package:flutter/material.dart';

class PaginationWrapper extends StatelessWidget {
  final Widget child;
  bool canLoadNextPage;
  final void Function() getNextPage;
  PaginationWrapper({
    Key? key,
    required this.child,
    this.canLoadNextPage = false,
    required this.getNextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notifications) {
        final metrics = notifications.metrics;
        final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;

        if (canLoadNextPage && metrics.pixels >= limit) {
          getNextPage();
          canLoadNextPage = false;
        }
        return false;
      },
      child: child,
    );
  }
}
