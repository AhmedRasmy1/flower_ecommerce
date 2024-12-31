import '../../../products/presentation/pages/products.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../products/presentation/widgets/skeleton_body.dart';
import '../best_seller_view_model/best_seller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../best_seller_view_model/best_seller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: AppLocalizations.of(context)!.bestSeller,
                  subtitle:
                      AppLocalizations.of(context)!.bestSellerTitleDescription,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<BestSellerViewModel, BestSellerState>(
                  builder: (context, state) {
                    if (state is LoadingBestSellerState) {
                      return const Expanded(child: SkeletonBody());
                    } else if (state is SuccessBestSellerState) {
                      List<BestSellerEntity>? listOfBestSeller =
                          state.bestSellerEntities;
                      return Expanded(
                        child: CustomCardAll(
                          bestSellerEntity: listOfBestSeller,
                        ),
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
      ),
    );
  }
}
