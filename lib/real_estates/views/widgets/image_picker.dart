import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesUploader extends StatefulWidget {
  final int imagesCount;
  final String title;
  const ImagesUploader({super.key, required this.title, this.imagesCount = -1});

  @override
  State<ImagesUploader> createState() => _ImagesUploaderState();
}

class _ImagesUploaderState extends State<ImagesUploader> {
  List<XFile> images = [];

  void _pickImages(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: source);
    if (image != null) setState(() => images.add(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            actions: [if (images.isNotEmpty) TextButton(onPressed: () => Navigator.pop(context, images), child: const Text("Done"))],
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(centerTitle: true, title: Text(widget.title, style: const TextStyle(fontSize: 20.0))),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              if (images.length > index) {
                return Center(child: Image(image: XFileImage(images[index])));
              }
              return null;
            }),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (widget.imagesCount > 0 && widget.imagesCount == images.length)
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _pickImages(ImageSource.camera),
                  child: const Icon(Icons.camera),
                ),
                const SizedBox(width: 24.0),
                FloatingActionButton(
                  onPressed: () => _pickImages(ImageSource.gallery),
                  child: const Icon(Icons.filter),
                ),
              ],
            ),
    );
  }
}
