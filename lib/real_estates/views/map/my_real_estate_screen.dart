import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/common/widgets/layout_grid.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/real_estate_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRealEstatesScreen extends ConsumerStatefulWidget {
  const MyRealEstatesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyRealEstatesScreenState();
}

class _MyRealEstatesScreenState extends ConsumerState<MyRealEstatesScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final myRealEstatesValue = ref.watch(myRealEstatesListStreamProvider);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // SliverToBoxAdapter(child: RealEstatesSearchTextField()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AsyncValueWidget<List<RealEstateModel>>(
                value: myRealEstatesValue,
                data: (products) => products.isEmpty
                    ? Center(child: Text('No real estate found', style: Theme.of(context).textTheme.headlineMedium))
                    : LayoutGridWidget(
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          final product = products[index];
                          return RealEstateCard(
                            realEstate: product,
                            onPressed: () => {},
                            // onPressed: () => context.goNamed(
                            //   AppRoute.product.name,
                            //   params: {'id': product.id},
                            // ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
