import 'package:flower_ecommerce/Features/categories/presentation/widgets/skeleton_bar.dart';
import 'package:flower_ecommerce/Features/products/presentation/pages/products.dart';

import '../../../products/presentation/widgets/skeleton_body.dart';
import '../best_seller_view_model/best_seller_state.dart';
import '../widgets/list_best_seller_widget.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/values_manager.dart';

import '../../domain/entities/best_seller_entity.dart';
import '../best_seller_view_model/best_seller_cubit.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {
  late BestSellerViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<BestSellerViewModel>();
    viewModel.getBestSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.bestSeller,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                AppStrings.bestSellerTitleDescription,
                style: TextStyle(fontSize: AppSize.s13),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<BestSellerViewModel, BestSellerState>(
                builder: (context, state) {
                  if (state is LoadingBestSellerState) {
                    return const Expanded(child: SkeletonBody());
                      const Center(child: CircularProgressIndicator());
                  } else if (state is SuccessBestSellerState) {
                    List<BestSellerEntity>? listOfBestSeller =
                        state.bestSellerEntities;

                    return Expanded(
                        child: CustomCardAll(bestSellerEntity: listOfBestSeller,)

                       );
                  } else if (state is ErrorBestSellerState) {
                    return Container(
                      color: Colors.red,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
