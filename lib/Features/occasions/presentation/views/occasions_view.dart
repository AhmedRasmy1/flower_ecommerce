import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../categories/presentation/widgets/skeleton_bar.dart';
import '../../../products/presentation/pages/products.dart';
import '../viewmodel/occasion_view_model/occasion_cubit.dart';
import '../viewmodel/occasion_view_model/occasion_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OccasionsView extends StatefulWidget {
  const OccasionsView({super.key});

  @override
  State<OccasionsView> createState() => _OccasionsViewState();
}

class _OccasionsViewState extends State<OccasionsView> {
  late OccasionViewModel viewModel;

  String? id;
  int selectedIndex = 0; // Track the selected tab

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<OccasionViewModel>();
    viewModel.getOccasions();
    viewModel.stream.listen(
      (state) {
        if (state is SuccessOccasionState &&
            state.occasionResponse?.occasions?.isNotEmpty == true) {
          setState(
            () {
              id = state.occasionResponse?.occasions?.first.id;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => viewModel,
                child: BlocBuilder<OccasionViewModel, OccasionState>(
                  builder: (context, state) {
                    // if (state is LoadingOccasionState) {
                    //   return const Center(child: CircularProgressIndicator());
                    // }
                    if (state is SuccessOccasionState) {
                      var occasions = state.occasionResponse?.occasions;
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 16),
                            child: CustomAppBar(
                              title: AppLocalizations.of(context)!.occasions,
                              subtitle: AppLocalizations.of(context)!
                                  .bloomBestSellers,
                              image: null,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          // Top section: List of occasions with underline
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: occasions?.length ?? 0,
                              itemBuilder: (context, index) {
                                final occasion = occasions?[index];
                                bool isSelected = selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      id = occasions?[index].id;
                                    });
                                    // print(id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0), // Space between tabs
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Occasion name
                                        Text(
                                          occasion?.name ?? 'Unknown',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: isSelected
                                                ? Colors
                                                    .pink // Highlighted text color
                                                : Colors
                                                    .black, // Default text color
                                          ),
                                        ),
                                        const SizedBox(height: 4), // Spacing
                                        // Underline for selected tab
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height: 2,
                                          width: isSelected
                                              ? 60
                                              : 0, // Width of line
                                          color: isSelected
                                              ? Colors.pink // Highlight color
                                              : Colors
                                                  .transparent, // Hidden for unselected
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is ErrorOccasionState) {
                      return Center(child: Text('Error: ${state.exception}'));
                    }
                    return const SkeletonBar();
                  },
                ),
              ),
              const SizedBox(),
              id != null && id!.isNotEmpty
                  ? Expanded(
                      child: GirdBodyOfProducts(
                        page: EnumPage.occasion,
                        pageId: id!,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
