import 'package:flutter/material.dart';

/// Custom image widget that loads an image as a static asset.
class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, this.imageUrl, this.recoverImage});
  final String? imageUrl;
  final String? recoverImage;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return Image.network(imageUrl!);
    } else {
      return Image.asset(recoverImage!);
    }
  }
}
