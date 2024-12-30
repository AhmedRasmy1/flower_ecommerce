import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/provider.dart';
import '../widgets/category_tap_bar.dart';
import '../widgets/custom_search.dart';
import '../widgets/filter_button.dart';
class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {


  String filterType = "Price After Discount";

  void showFilterSheet() {
    final sortProvider = Provider.of<SortProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Price After Discount"),
                onTap: () {
                  setState(() {
                    filterType = "priceAfterDiscount(ascending)";
                  sortProvider.changeFilter(filterType);
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text("price after`discount(descending)"),
                onTap: () {
                  setState(() {
                    filterType = "-priceAfterDiscount";
                    sortProvider.changeFilter(filterType);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Quantity (Ascending)"),
                onTap: () {
                  setState(() {
                    filterType = "quantity";
                    sortProvider.changeFilter(filterType);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Quantity (Descending)"),
                onTap: () {
                  setState(() {
                    filterType = "-quantity";
                   sortProvider.changeFilter(filterType);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomSearch(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CategoryTapBar(filterType: filterType),
                  InkWell(
                    onTap: showFilterSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Adjust the padding for size
                      margin: const EdgeInsets.all(16), // Add margin for spacing
                      decoration: BoxDecoration(
                        color: Colors.pink, // Button color
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      child: const Text(
                        "Show Filter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Adjust text size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}