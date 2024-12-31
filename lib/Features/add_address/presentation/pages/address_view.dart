import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../manager/add_address_cubit.dart';
import '../widgets/add_address_body.dart';
import '../widgets/my_location.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  late AddAddressCubit viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<AddAddressCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAppBar(
              title: AppLocalizations.of(context)!.add_address,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 24),
            MyLocation(
              viewModel: viewModel,
            ),
            AddAddressBody(
              viewModel: viewModel,
            ),
          ],
        ),
      ),
    );
  }
}
