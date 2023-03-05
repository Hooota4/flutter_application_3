import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/constants.dart';

class ImageDisplay extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imageURL;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final bool isPlaceholder;

  const ImageDisplay({
    super.key,
    this.imageURL,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: FadeInImage(
        fit: fit,
        height: height,
        width: width ?? double.infinity,
        image: NetworkImage(isPlaceholder ? imagePlaceHolder : (imageURL ?? "")),
        placeholder: const AssetImage(imagePlaceHolder),
        imageErrorBuilder: (_, __, ___) => Image.asset(imagePlaceHolder, width: width, height: height),
        placeholderErrorBuilder: (_, __, ___) => const Center(child: CircularProgressIndicator()),
        placeholderFit: BoxFit.cover,
      ),
    );
  }
}
