import 'package:first_flutter_project/utils/helpers.dart';
import 'package:flutter/material.dart';

class TataPlayContainer extends StatelessWidget {
  final Widget child;

  const TataPlayContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: tpBgDecoration,
      child: child,
    );
  }
}
