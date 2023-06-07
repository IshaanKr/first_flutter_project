import 'package:first_flutter_project/configuration.dart';
import 'package:flutter/material.dart';

import '../utils/helpers.dart';
import 'focusable_tv_widget.dart';

class FocusableList extends StatelessWidget {
  const FocusableList({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: const Column(
        children: [
          FocusTraversalOrder(
            order: NumericFocusOrder(1.0),
            child: HorizontalDemoList(1),
          ),
          FocusTraversalOrder(
            order: NumericFocusOrder(2.0),
            child: HorizontalDemoList(2),
          ),
        ],
      ),
    );
  }
}

class HorizontalDemoList extends StatefulWidget {
  final int index;

  const HorizontalDemoList(
    this.index, {
    super.key,
  });

  @override
  State<HorizontalDemoList> createState() => _HorizontalDemoListState();
}

class _HorizontalDemoListState extends State<HorizontalDemoList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: posterRailHeight,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => FocusableTVWidget(
          onTap: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Text(
                  "${"Row : -1 Item : ${index + 1}"} Clicked",
                  style: whiteTextStyle,
                ),
              ),
            );
          },
          child: (_, isFocused) => Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: isFocused ? Colors.red : Colors.white,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Item : ${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoBack extends Intent {
  const GoBack();
}
