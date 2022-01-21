import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final String imageUrl;
  final double gap;

  const ProfileAvatar({
    Key? key,
    this.strokeWidth = 4,
    this.radius = 40,
    this.gap = 6,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.all(gap),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor, width: strokeWidth),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
