import 'package:first_flutter_project/rail/poster_rail/poster_card_row.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';
import '../../home_screen/rest_client.dart';

class PosterRail extends StatelessWidget {
  const PosterRail({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: posterRailHeight,
      child: PosterCardRow(contents: item.contents),
    );
  }
}
