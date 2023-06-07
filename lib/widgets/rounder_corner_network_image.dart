import 'package:flutter/material.dart';

import '../configuration.dart';

class RoundedCornerNetworkImage extends StatelessWidget {
  const RoundedCornerNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(posterCornerRadius),
      child: Image.network(
        url,
        height: posterHeight,
      ),
    );
  }
}
