import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../products/presentation/pages/products.dart';
import '../viewmodel/occasion_view_model/occasion_cubit.dart';
import '../viewmodel/occasion_view_model/occasion_state.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Occasions'
                ,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,),textAlign: TextAlign.start,),
            Text('Bloom with exquisite best sellers',style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),),
          ],
        )
      ),
      body: Column(
        children: [

          BlocProvider(
            create: (context) => viewModel,
            child: BlocBuilder<OccasionViewModel, OccasionState>(
              builder: (context, state) {
                if (state is LoadingOccasionState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccessOccasionState) {
                  var occasions = state.occasionResponse?.occasions;
                  return Column(
                    children: [
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
                                print(id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0), // Space between tabs
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Occasion name
                                    Text(
                                      occasion?.name ?? 'Unknown',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "inter",
                                        color: isSelected
                                            ? Colors.pink // Highlighted text color
                                            : Colors.black, // Default text color
                                      ),
                                    ),
                                    const SizedBox(height: 4), // Spacing
                                    // Underline for selected tab
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      height: 2,
                                      width: isSelected ? 60 : 0, // Width of line
                                      color: isSelected
                                          ? Colors.pink // Highlight color
                                          : Colors.transparent, // Hidden for unselected
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
                } else {
                  return const Center(child: Text('No data available'));
                }
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
              : const Center(child: Text('Select an occasion to view details')),
        ],
      ),
    );
  }
}