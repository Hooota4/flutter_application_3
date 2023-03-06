import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:flutter_application_3/common/widgets/custom_image_widget.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Used to show a single product inside a card.
class RealEstateCard extends ConsumerWidget {
  const RealEstateCard({super.key, required this.realEstate, this.onPressed});
  final RealEstateModel realEstate;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImageWidget(
                imageUrl: "$imagesUrl${realEstate.images?[0].url}",
                recoverImage: "images/home.png",
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Text(realEstate.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text("${realEstate.price} SDG", style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}
