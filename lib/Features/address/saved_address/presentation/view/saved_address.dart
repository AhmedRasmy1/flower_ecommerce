import 'package:flower_ecommerce/Features/address/saved_address/presentation/widgets/address_item.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../view_models/get_address/address_cubit.dart';
import '../view_models/get_address/address_state.dart';
import '../view_models/remove_address/remove_cubit.dart';

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
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 30,
            ),
          ),
          title: Text(
            AppStrings.savedAddress,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        body: BlocBuilder<AddressViewModel, AddressState>(
          builder: (context, state) {
            if (state is LoadingAddressState) {
              return const LoadingIndicator();
            } else if (state is ErrorAddressState) {
              return const Center(child: Text("something went wrong"));
            } else if (state is SuccessAddressState) {
              return Column(
                children: [
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
                          //Navigate to Add Address screen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          AppStrings.addNewAddress,
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
    );
  }
}
