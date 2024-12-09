import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';

import '../widgets/address_item.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../view_models/get_address/address_cubit.dart';
import '../view_models/get_address/address_state.dart';
import '../view_models/remove_address/remove_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({super.key});

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  late AddressViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AddressViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoveAddressViewModel>(
          create: (context) => getIt.get<RemoveAddressViewModel>(),
        ),
        BlocProvider<AddressViewModel>(
          create: (context) => viewModel
            ..getAddress(
              "Bearer ${CacheService.getData(key: CacheConstants.userToken)}",
            ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<AddressViewModel, AddressState>(
            builder: (context, state) {
              if (state is LoadingAddressState) {
                return const LoadingIndicator();
              } else if (state is ErrorAddressState) {
                return const Center(child: Text("something went wrong"));
              } else if (state is SuccessAddressState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAppBar(
                        title: AppLocalizations.of(context)!.savedAddress,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                        itemBuilder: (context, index) => AddressItem(
                          onRemove: () {
                            setState(() {
                              state.addresses.addresses!.removeAt(index);
                            });
                          },
                          addressesEntity: state.addresses.addresses![index],
                        ),
                        itemCount: state.addresses.addresses!.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutesManager.addAddressView);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.add_new_address,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
