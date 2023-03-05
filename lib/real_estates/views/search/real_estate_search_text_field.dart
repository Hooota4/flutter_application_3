import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/helpers/to_capitalized.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estates_search_state_provider.dart';
import 'package:flutter_application_3/real_estates/models/filter_values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

/// Search field used to filter products by name
class RealEstatesSearchTextField extends ConsumerStatefulWidget {
  const RealEstatesSearchTextField({super.key});

  @override
  ConsumerState<RealEstatesSearchTextField> createState() => _RealEstatesSearchTextFieldState();
}

class _RealEstatesSearchTextFieldState extends ConsumerState<RealEstatesSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _controller,
              builder: (context, value, _) {
                return TextField(
                  controller: _controller,
                  autofocus: false,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: 'Search Real Estates',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    icon: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: value.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _controller.clear();
                              ref.read(realEstatesSearchQueryStateProvider.notifier).state = '';
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                  onChanged: (text) => ref.read(realEstatesSearchQueryStateProvider.notifier).state = text,
                );
              },
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
              onPressed: () async {
                await showDialog<bool>(
                  context: context,
                  builder: (context) => const AlertDialog(content: FiltersValueWidget()),
                );
              },
              icon: const Icon(Icons.filter_list_alt))
        ],
      ),
    );
  }
}

class FiltersValueWidget extends ConsumerStatefulWidget {
  const FiltersValueWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FiltersValueWidgetState();
}

class _FiltersValueWidgetState extends ConsumerState<FiltersValueWidget> {
  double slider = 0.0;

  @override
  Widget build(BuildContext context) {
    final filtersValuesValue = ref.watch(realEstatesFiltersValuesStreamProvider);

    return AsyncValueWidget<FilterValuesModel>(
      value: filtersValuesValue,
      data: (filtersValues) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Price'),
              Row(
                children: [
                  const Text("0"),
                  Slider(
                    label: 'Price',
                    min: 0.0,
                    value: slider,
                    divisions: (filtersValues?.maxPrice.toDouble() ?? 0) ~/ 1000,
                    max: filtersValues?.maxPrice.toDouble() ?? 0,
                    onChanged: (value) => setState(() => slider = value),
                    onChangeEnd: (value) => ref.read(realEstatesPriceFilterStateProvider.notifier).state = value,
                  ),
                  Text(slider.toStringAsFixed(0)),
                ],
              ),
              const SizedBox(height: 16),
              MultiSelectDialogField<String>(
                title: const Text("Filter by States"),
                buttonText: const Text("Filter by States"),
                listType: MultiSelectListType.LIST,
                backgroundColor: Colors.grey.shade800,
                itemsTextStyle: const TextStyle(color: Colors.white),
                selectedItemsTextStyle: const TextStyle(color: Colors.white),
                checkColor: Colors.white,
                selectedColor: Colors.deepPurple.shade200,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 2,
                items: filtersValues?.states.map((city) => MultiSelectItem(city, city)).toList() ?? [],
                onConfirm: (values) => ref.read(realEstatesStateFilterStateProvider.notifier).state = values,
              ),
              const SizedBox(height: 16),
              MultiSelectDialogField<String>(
                title: const Text("Filter by City"),
                buttonText: const Text("Filter by City"),
                listType: MultiSelectListType.LIST,
                backgroundColor: Colors.grey.shade800,
                itemsTextStyle: const TextStyle(color: Colors.white),
                selectedItemsTextStyle: const TextStyle(color: Colors.white),
                checkColor: Colors.white,
                selectedColor: Colors.deepPurple.shade100,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 2,
                items: filtersValues?.cities.map((city) => MultiSelectItem(city, city)).toList() ?? [],
                onConfirm: (values) => ref.read(realEstatesCityFilterStateProvider.notifier).state = values,
              ),
              const SizedBox(height: 16),
              MultiSelectDialogField<String>(
                title: const Text("Filter by Real Estate Type"),
                buttonText: const Text("Filter by Real Estate Type"),
                listType: MultiSelectListType.LIST,
                backgroundColor: Colors.grey.shade800,
                itemsTextStyle: const TextStyle(color: Colors.white),
                selectedItemsTextStyle: const TextStyle(color: Colors.white),
                checkColor: Colors.white,
                selectedColor: Colors.deepPurple.shade100,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 2,
                items: RealEstateType.values
                    .map((realEstateType) => MultiSelectItem(realEstateType.name.toCapitalized(), realEstateType.name.toCapitalized()))
                    .toList(),
                onConfirm: (values) => ref.read(realEstatesTypeFilterStateProvider.notifier).state = values,
              ),
              const SizedBox(height: 16),
              MultiSelectDialogField<String>(
                title: const Text("Filter by Operation Type"),
                buttonText: const Text("Filter by Operation Type"),
                listType: MultiSelectListType.LIST,
                backgroundColor: Colors.grey.shade800,
                itemsTextStyle: const TextStyle(color: Colors.white),
                selectedItemsTextStyle: const TextStyle(color: Colors.white),
                checkColor: Colors.white,
                selectedColor: Colors.deepPurple.shade100,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 2,
                items:
                    Operation.values.map((operationType) => MultiSelectItem(operationType.name.toCapitalized(), operationType.name.toCapitalized())).toList(),
                onConfirm: (values) => ref.read(realEstatesOperationFilterStateProvider.notifier).state = values,
              ),
            ],
          ),
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
// runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
// const MyApp({Key? key}) : super(key: key);
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'Flutter DropDownButton',
// 	theme: ThemeData(
// 		primarySwatch: Colors.green,
// 	),
// 	home: const MyHomePage(),
// 	debugShowCheckedModeBanner: false,
// 	);
// }
// }

// class MyHomePage extends StatefulWidget {
// const MyHomePage({Key? key}) : super(key: key);

// @override
// _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
	
// // Initial Selected Value
// String dropdownvalue = 'Item 1';

// // List of items in our dropdown menu
// var items = [	
// 	'Item 1',
// 	'Item 2',
// 	'Item 3',
// 	'Item 4',
// 	'Item 5',
// ];
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(
// 		title: const Text("Geeksforgeeks"),
// 	),
// 	body: Center(
// 		child: Column(
// 		mainAxisAlignment: MainAxisAlignment.center,
// 		children: [
		
// 		],
// 		),
// 	),
// 	);
// }
// }
