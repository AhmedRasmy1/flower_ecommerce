import '../../domain/entities/response/address_entity.dart';
import '../view_models/remove_address/remove_state.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/remove_address/remove_cubit.dart';

class AddressItem extends StatefulWidget {
  final AddressesEntity addressesEntity;
  final VoidCallback onRemove;

  const AddressItem(
      {required this.addressesEntity, required this.onRemove, super.key});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  // late RemoveAddressViewModel viewModel;
  //
  // @override
  // void initState() {
  //   viewModel = getIt.get<RemoveAddressViewModel>();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RemoveAddressViewModel>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 4,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ]),
          width: 343,
          height: 83,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 20,
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/location.png"),
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        widget.addressesEntity.city!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                    // SizedBox(
                    //   width: 170,
                    // ),
                    InkWell(
                      onTap: () async {
                        await viewModel.removeAddress(
                          "Bearer ${CacheService.getData(key: CacheConstants.userToken)}",
                          widget.addressesEntity.id!,
                        );
                        if (context.read<RemoveAddressViewModel>().state
                            is SuccessRemoveAddressState) {
                          widget.onRemove();
                        }
                      },
                      child: ImageIcon(
                        AssetImage("assets/images/delete.png"),
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 19),
                      child: ImageIcon(
                        AssetImage("assets/images/pen.png"),
                        size: 24,
                        color: ColorManager.placeHolderColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  widget.addressesEntity.street!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.placeHolderColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
