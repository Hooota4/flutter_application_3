import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/map/location_picker.dart';
import 'package:flutter_application_3/real_estates/views/widgets/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdvertisement extends StatefulWidget {
  const CreateAdvertisement({Key? key}) : super(key: key);

  @override
  State<CreateAdvertisement> createState() => _CreateAdvertisementState();
}

class _CreateAdvertisementState extends State<CreateAdvertisement> {
  String? type;
  String? operation;
  late LatLng location;
  late List<XFile> images;
  late List<XFile> ownerShipProof;
  late final TextEditingController _title;
  late final TextEditingController _state;
  late final TextEditingController _city;
  late final TextEditingController _price;
  late final TextEditingController _phone;
  late final TextEditingController _description;
  late final TextEditingController _facilityNum;

  @override
  void initState() {
    _title = TextEditingController();
    _state = TextEditingController();
    _city = TextEditingController();
    _price = TextEditingController();
    _phone = TextEditingController();
    _description = TextEditingController();
    _facilityNum = TextEditingController();
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
    _facilityNum.dispose();

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
                      label: const Text('Real Estate Type'),
                      dropdownMenuEntries: estatesTypesEntries,
                      inputDecorationTheme: const InputDecorationTheme(filled: true),
                      onSelected: (String? estateType) => setState(() => type = estateType),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("For Sell"),
                            value: "Sell",
                            groupValue: operation,
                            onChanged: (value) => setState(() => operation = value.toString()),
                          ),
                        ),
                        Expanded(
                            child: RadioListTile(
                          title: const Text("For Rent"),
                          value: "Rent",
                          groupValue: operation,
                          onChanged: (value) => setState(() => operation = value.toString()),
                        ))
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _facilityNum,
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
                                  location = (await showDialog(
                                        context: context,
                                        builder: (context) => const LocationPicker(),
                                      )) ??
                                      const LatLng(0, 0);
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
                                  images = (await showDialog(
                                        context: context,
                                        builder: (context) => const ImagesUploader(title: "Real Estate Photos"),
                                      )) ??
                                      [];
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
                                  ownerShipProof = (await showDialog(
                                        context: context,
                                        builder: (context) => const ImagesUploader(title: "Ownership Proof "),
                                      )) ??
                                      [];
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
                      return ElevatedButton(
                        onPressed: () async {
                          final estate = RealEstateModel(
                            title: _title.text.trim(),
                            type: type ?? "",
                            facilitiesNum: _facilityNum.text.trim(),
                            state: _state.text.trim(),
                            city: _city.text.trim(),
                            description: _description.text.trim(),
                            price: _price.text.trim(),
                            approval: "Waiting",
                            nationalID: "", //canceled
                            location: jsonEncode(location.toJson()),
                            id: 0,
                            operation: operation ?? "Sell",
                          );

                          final result = await ref.read(createOrUpdateRealEstateProvider(estate, images, ownerShipProof).future);
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
