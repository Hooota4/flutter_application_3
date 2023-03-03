import 'package:flutter/material.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estates_search_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              icon: const Icon(Icons.search),
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
    );
  }
}
