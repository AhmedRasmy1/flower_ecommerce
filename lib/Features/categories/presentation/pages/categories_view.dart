
import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import '../../../../core/common/providers.dart';
import '../../../../core/di/di.dart';
import '../../../products/presentation/manager/all_products_cubit.dart';
import '../widgets/category_tap_bar.dart';
import '../widgets/custom_search.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<SortTypeProvider>(
        builder: (context, sortTypeProvider, child) {
          return
             Column(
          children: [
          const CustomSearch(),
          Expanded(
          child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
          CategoryTapBar(sortType: sortTypeProvider.currentSortType), //




              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return FilterSheet();
                    },
                  );
                },
                child: Text('filter'),
              ),
              SizedBox(height: 20),

            ],),
          ),]);

        },)
      );
  }
}
class FilterSheet extends StatefulWidget {

  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late AllProductsViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AllProductsViewModel>()
      ..doIntent(GetAllProductsAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>viewModel,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('By quantity Descending'),
              onTap: () {setState(() {
                Provider.of<SortTypeProvider>(context,listen: false).updateSortType('-quantity');
               viewModel.getAllProducts('-quantity');



              });
      // Call the callback
                Navigator.pop(context);

              },
            ),
            ListTile(
              title: const Text('By quantity Ascending'),
              onTap: () {setState(() {
                Provider.of<SortTypeProvider>(context,listen: false).updateSortType('quantity');
                viewModel.getAllProducts('quantity');
              });
       // Call the callback
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('By price'),
              onTap: () {setState(() {
                Provider.of<SortTypeProvider>(context,listen: false).updateSortType('priceAfterDiscount');
                viewModel.getAllProducts('priceAfterDiscount');
              });


               // Call the callback
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import '../widgets/category_tap_bar.dart';
import '../widgets/custom_search.dart';
import '../widgets/filter_button.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomSearch(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CategoryTapBar(),
                  FilterButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
