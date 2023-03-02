import 'package:flutter/material.dart';
import 'package:flutter_application_3/add/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/add/models/real_estate_model.dart';
import 'package:flutter_application_3/add/views/image_picker.dart';
import 'package:flutter_application_3/add/views/location_picker.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdvertisement extends StatefulWidget {
  const CreateAdvertisement({Key? key}) : super(key: key);

  @override
  State<CreateAdvertisement> createState() => _CreateAdvertisementState();
}

class _CreateAdvertisementState extends State<CreateAdvertisement> {
  String? selectedEstateType;
  late List<XFile>? estateImages;
  late List<XFile>? authenticationImage;
  late LatLng? location;
  late final TextEditingController _realEstateController;
  late final TextEditingController _title;
  late final TextEditingController _state;
  late final TextEditingController _city;
  late final TextEditingController _facilityNumber;
  late final TextEditingController _price;
  late final TextEditingController _phone;
  late final TextEditingController _description;

  @override
  void initState() {
    _title = TextEditingController();
    _state = TextEditingController();
    _city = TextEditingController();
    _price = TextEditingController();
    _phone = TextEditingController();
    _description = TextEditingController();
    _facilityNumber = TextEditingController();
    _realEstateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _state.dispose();
    _city.dispose();
    _price.dispose();
    _phone.dispose();
    _description.dispose();
    _facilityNumber.dispose();
    try {
      _realEstateController.dispose();
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> estatesTypesEntries = <DropdownMenuEntry<String>>[];
    for (final String estatesType in estatesTypes) {
      estatesTypesEntries.add(DropdownMenuEntry<String>(value: estatesType, label: estatesType));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Create Advertisement')),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(children: [
                    TextFormField(
                      controller: _title,
                      decoration: const InputDecoration(hintText: "Enter adv.title"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _state,
                      decoration: const InputDecoration(hintText: "Enter State"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _city,
                      decoration: const InputDecoration(hintText: "Enter City"),
                    ),
                    const SizedBox(height: 16),
                    DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width - 32,
                      controller: _realEstateController,
                      enableFilter: true,
                      label: const Text('Real Estate Type'),
                      dropdownMenuEntries: estatesTypesEntries,
                      inputDecorationTheme: const InputDecorationTheme(filled: true),
                      onSelected: (String? estateType) => setState(() => selectedEstateType = estateType),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _facilityNumber,
                      decoration: const InputDecoration(hintText: "number of facility "),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _price,
                      decoration: const InputDecoration(hintText: "Enter price"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(hintText: "Enter Phone"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _description,
                      minLines: 3,
                      maxLines: 6,
                      decoration: const InputDecoration(hintText: "Enter Description"),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  location = await showDialog(
                                    context: context,
                                    builder: (context) => const LocationPicker(),
                                  );
                                  setState(() {});
                                },
                                icon: const Icon(Icons.map, size: 64)),
                            const Text("Pin in the Map"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  estateImages = await showDialog(
                                    context: context,
                                    builder: (context) => const ImagesUploader(imageCount: 3),
                                  );
                                  setState(() {});
                                },
                                icon: const Icon(Icons.image, size: 64)),
                            const Text("R-Estate Docs."),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  authenticationImage = await showDialog(
                                    context: context,
                                    builder: (context) => const ImagesUploader(),
                                  );
                                  setState(() {});
                                },
                                icon: const Icon(Icons.image, size: 64)),
                            const Text("R-Estate Photos"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer(builder: (context, ref, child) {
                      final auth = ref.watch(authControllerProvider);

                      return ElevatedButton(
                        onPressed: () async {
                          final estate = RealEstateModel(
                            addvertiser: auth.user!.id!,
                            estate_name: _title.text.trim(),
                            estate_type: selectedEstateType ?? "",
                            number_of_facilities: _facilityNumber.text.trim(),
                            state: _state.text.trim(),
                            city: _city.text.trim(),
                            estate_description: _description.text.trim(),
                            price: _price.text.trim(),
                            estate_status: "Waitting",
                            owner_national_number: "", //canceled
                            location: location.toString(),
                            optional_details: _description.text.trim(),
                            map_location: location.toString(), //same as location
                          );

                          final images = [...?estateImages, ...?authenticationImage];
                          setState(() {});
                          final result = await ref
                              .read(
                                realEstateControllerProvider.notifier,
                              )
                              .addRealEstate(
                                realEstate: estate,
                                images: images,
                              );
                          if (result && context.mounted) Navigator.of(context).pushReplacementNamed("homepage");
                        },
                        child: const Text("Add Advertisement", style: TextStyle(fontSize: 16)),
                      );
                    }),
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
