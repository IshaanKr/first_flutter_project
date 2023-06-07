import 'package:first_flutter_project/widgets/focusable_tv_widget.dart';
import 'package:first_flutter_project/widgets/rounder_corner_network_image.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';
import '../../utils/helpers.dart';
import '../../home_screen/rest_client.dart';

class PosterCardRow extends StatelessWidget {
  const PosterCardRow({
    super.key,
    required this.contents,
  });

  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: contents.length,
      separatorBuilder: (_, __) => posterDivider,
      itemBuilder: (context, index) {
        var content = contents[index];
        return SizedBox(
          width: posterWidth,
          child: FocusableTVWidget(
            child: (_, isFocused) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: isFocused ? Colors.white : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(posterCornerRadius)),
                  child: RoundedCornerNetworkImage(
                    url: content.image,
                  ),
                ),
                Text(
                  content.provider,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
