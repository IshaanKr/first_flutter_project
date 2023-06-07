import 'package:first_flutter_project/rail/poster_rail/poster_card_row.dart';
import 'package:first_flutter_project/rail/poster_rail/poster_rail.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';
import '../utils/helpers.dart';
import '../home_screen/rest_client.dart';

class Rail extends StatelessWidget {
  const Rail({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    if (item.contents.isEmpty) {
      return emptyWidget;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getRailHeader(),
        _getRailContent(),
      ],
    );
  }

  Widget _getRailHeader() {
    var sectionSource = item.sectionSource;

    if (sectionSource == editorialSectionSource) {
      return Container(
        padding:
            const EdgeInsets.symmetric(vertical: posterHeaderVerticalPadding),
        child: Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: railTitleFontSize,
          ),
        ),
      );
    }

    return emptyWidget;
  }

  Widget _getRailContent() {
    var sectionSource = item.sectionSource;

    if (sectionSource == editorialSectionSource) {
      return PosterRail(item: item);
    }

    return emptyWidget;
  }
}

