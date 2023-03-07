import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/common/widgets/layout_grid.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/real_estate_detail.dart';
import 'package:flutter_application_3/real_estates/views/widgets/real_estate_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                data: (realEstates) => realEstates?.isEmpty ?? false
                    ? Center(child: Text('No real estate found', style: Theme.of(context).textTheme.headlineMedium))
                    : LayoutGridWidget(
                        itemCount: realEstates?.length ?? 0,
                        itemBuilder: (_, index) {
                          final realEstate = realEstates![index];
                          return Stack(
                            children: [
                              RealEstateCard(
                                realEstate: realEstate,
                                onPressed: () => realEstate.approval != "Accepted"
                                    ? Fluttertoast.showToast(msg: "Real Estate is not ACCEPTED yet", toastLength: Toast.LENGTH_LONG)
                                    : showDialog(
                                        context: context,
                                        builder: (context) => RealEstateDetailsScreen(id: realEstate.id),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  iconSize: 22,
                                  padding: EdgeInsets.zero,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black.withOpacity(0.8)),
                                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
                                  ),
                                  onPressed: () async {
                                    var confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: const Text('Are you sure, you want to delete this real estate?'),
                                        actions: [
                                          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("YES")),
                                          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("NO")),
                                        ],
                                      ),
                                    );
                                    if (confirmed ?? false) await ref.read(deleteRealEstateProvider(realEstate.id).future);
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              )
                            ],
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
