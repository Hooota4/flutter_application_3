import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class LayoutGridWidget extends StatelessWidget {
  const LayoutGridWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;

  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final crossAxisCount = max(1, width ~/ 180);

      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      final rowSizes = List.generate(numRows, (_) => auto);
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: 16,
        columnGap: 16,
        children: [for (var i = 0; i < itemCount; i++) itemBuilder(context, i)],
      );
    });
  }
}
