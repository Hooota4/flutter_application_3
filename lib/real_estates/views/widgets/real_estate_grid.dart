import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/common/widgets/layout_grid.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estates_search_state_provider.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/real_estate_detail.dart';
import 'package:flutter_application_3/real_estates/views/widgets/real_estate_card.dart';
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
        data: (realEstates) => realEstates?.isEmpty ?? true
            ? Center(child: Text('No real estate found', style: Theme.of(context).textTheme.headlineMedium))
            : LayoutGridWidget(
                itemCount: realEstates?.length ?? 0,
                itemBuilder: (_, index) {
                  final realEstate = realEstates![index];
                  return RealEstateCard(
                    realEstate: realEstate,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => RealEstateDetailsScreen(id: realEstate.id),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// Grid widget with content-sized items.
