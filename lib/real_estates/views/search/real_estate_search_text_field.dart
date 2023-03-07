import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/constants.dart';
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
                return TextFormField(
                  initialValue: ref.watch(filterStateProvider).searchQuery,
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
                              ref.watch(filterStateProvider.notifier).update(searchQuery: "");
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                  onChanged: (query) => ref.watch(filterStateProvider.notifier).update(searchQuery: query),
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

class FiltersValueWidget extends ConsumerWidget {
  const FiltersValueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersValuesValue = ref.watch(realEstatesFiltersValuesStreamProvider);

    return AsyncValueWidget<FilterValuesModel>(
      value: filtersValuesValue,
      data: (filtersValues) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter Real Estates", style: Theme.of(context).textTheme.titleLarge),
                  IconButton(onPressed: ref.watch(filterStateProvider.notifier).update, icon: const Icon(Icons.clear))
                ],
              ),
              const Divider(),
              const SizedBox(height: 24),
              const Text('Price'),
              Slider(
                label: "${ref.watch(filterStateProvider).priceFilter ~/ 1000}K SDG",
                min: 0.0,
                value: ref.watch(filterStateProvider).priceFilter,
                divisions: (filtersValues?.maxPrice.toDouble() ?? 0) ~/ 1000,
                max: (filtersValues?.maxPrice.toDouble() ?? 1000000000000) + 10000,
                onChanged: (value) => ref.watch(filterStateProvider.notifier).update(priceFilter: value),
                onChangeEnd: (value) => ref.watch(filterStateProvider.notifier).update(priceFilter: value),
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
                dialogHeight: MediaQuery.of(context).size.height / 3,
                items: filtersValues?.states.map((city) => MultiSelectItem(city, city)).toList() ?? [],
                onConfirm: (values) => ref.watch(filterStateProvider.notifier).update(stateFilter: values),
                initialValue: ref.watch(filterStateProvider).stateFilter,
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
                selectedColor: Colors.deepPurple.shade200,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 3,
                items: filtersValues?.cities.map((city) => MultiSelectItem(city, city)).toList() ?? [],
                onConfirm: (values) => ref.watch(filterStateProvider.notifier).update(cityFilter: values),
                initialValue: ref.watch(filterStateProvider).cityFilter,
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
                selectedColor: Colors.deepPurple.shade200,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 3,
                items: RealEstateType.values.map((types) => MultiSelectItem(types.name.toCapitalized(), types.name.toCapitalized())).toList(),
                onConfirm: (values) => ref.watch(filterStateProvider.notifier).update(typeFilter: values),
                initialValue: ref.watch(filterStateProvider).typeFilter,
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
                selectedColor: Colors.deepPurple.shade200,
                unselectedColor: Colors.grey,
                dialogHeight: MediaQuery.of(context).size.height / 3,
                items: Operation.values.map((opTypes) => MultiSelectItem(opTypes.name.toCapitalized(), opTypes.name.toCapitalized())).toList(),
                onConfirm: (values) => ref.watch(filterStateProvider.notifier).update(opFilter: values),
                initialValue: ref.watch(filterStateProvider).opFilter,
              ),
            ],
          ),
        );
      },
    );
  }
}
