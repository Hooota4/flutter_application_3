import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:flutter_application_3/common/helpers/to_capitalized.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/common/widgets/image_display.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/images_model.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealEstateDetailsScreen extends ConsumerStatefulWidget {
  final int id;
  const RealEstateDetailsScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealEstateDetailsScreenState();
}

class _RealEstateDetailsScreenState extends ConsumerState<RealEstateDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final realEstateValue = ref.watch(realEstateStreamProvider(widget.id));
    return AsyncValueWidget<RealEstateModel>(
      value: realEstateValue,
      data: (realEstate) {
        return realEstate == null
            ? Center(child: Text('Real estate not found', style: Theme.of(context).textTheme.headlineMedium))
            : Scaffold(
                appBar: AppBar(
                  title: Text(realEstate.title.toTitleCase()),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RealEstateImagesSlider(images: realEstate.images),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${realEstate.price} SDG",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                          ),
                          Text(
                            "${realEstate.state}, ${realEstate.city}",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            realEstate.type,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                          ),
                          Text(
                            "for",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.purple.shade300),
                          ),
                          Text(
                            realEstate.operation,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Advertizer"),
                                Text(
                                  "${realEstate.advertiser} ",
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Facilities"),
                                Text(
                                  "${realEstate.facilitiesNum} ",
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Details"),
                          Text(
                            "${realEstate.description} ",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.purple.shade300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class RealEstateImagesSlider extends ConsumerStatefulWidget {
  final List<ImageModel>? images;
  const RealEstateImagesSlider({super.key, this.images});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealEstateImagesSliderState();
}

class _RealEstateImagesSliderState extends ConsumerState<RealEstateImagesSlider> {
  late CarouselController _carousel;

  @override
  void initState() {
    _carousel = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ImageModel> images = widget.images ?? <ImageModel>[];

    switch (images.length) {
      case 0:
        return const ImageDisplay(isPlaceholder: true, height: 300);
      case 1:
        return ImageDisplay(imageURL: '$imagesUrl${images[0].url}', height: 300);

      default:
        return Stack(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) => ImageDisplay(imageURL: '$imagesUrl${images[index].url}', height: 300),
              options: CarouselOptions(autoPlay: false, enlargeCenterPage: true, viewportFraction: 1),
              carouselController: _carousel,
            ),
            Visibility(
              visible: images.length > 1,
              child: Positioned(
                top: 100,
                right: 10,
                child: IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: _carousel.nextPage),
              ),
            ),
            Visibility(
              visible: images.length > 1,
              child: Positioned(
                top: 100,
                left: 10,
                child: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: _carousel.previousPage),
              ),
            ),
          ],
        );
    }
  }
}
