import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estates_search_state_provider.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/search/real_estate_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealEstateGrid extends ConsumerWidget {
  const RealEstateGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final realEstatesListValue = ref.watch(realEstatesSearchResultsProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AsyncValueWidget<List<RealEstateModel>>(
        value: realEstatesListValue,
        data: (products) => products.isEmpty
            ? Center(child: Text('No real estate found', style: Theme.of(context).textTheme.headlineMedium))
            : ProductsLayoutGrid(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return RealEstateCard(
                    realEstate: product,
                    onPressed: () => {},
                    // onPressed: () => context.goNamed(
                    //   AppRoute.product.name,
                    //   params: {'id': product.id},
                    // ),
                  );
                },
              ),
      ),
    );
  }
}

/// Grid widget with content-sized items.
class ProductsLayoutGrid extends StatelessWidget {
  const ProductsLayoutGrid({
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
