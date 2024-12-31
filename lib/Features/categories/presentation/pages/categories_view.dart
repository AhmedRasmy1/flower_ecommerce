import 'package:flower_ecommerce/Features/categories/presentation/widgets/upperfilterbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
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
    String? selectedSortType = sortProvider.filterType;
    double minPrice = 100;
    double maxPrice = 4000;
    double startPrice = minPrice;
    double endPrice = maxPrice;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Sort by",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              buildRadioListTile(
                "Lowest Price",
                "priceAfterDiscount",
                selectedSortType,
                    (value) {
                  setState(() {
                    selectedSortType = value;
                    sortProvider.changeFilter(selectedSortType);
                  });
                  Navigator.pop(context);
                },
              ),
              buildRadioListTile(
                "Highest Price",
                "-priceAfterDiscount",
                selectedSortType,
                    (value) {
                  setState(() {
                    selectedSortType = value;
                    sortProvider.changeFilter(selectedSortType);
                  });
                  Navigator.pop(context);
                },
              ),
              buildRadioListTile(
                "less quantity",
                "quantity",
                selectedSortType,
                    (value) {
                  setState(() {
                    selectedSortType = value;
                    sortProvider.changeFilter(selectedSortType);
                  });
                  Navigator.pop(context);
                },
              ),
              buildRadioListTile(
                " higher quantity",
                "-quantity",
                selectedSortType,
                    (value) {
                  setState(() {
                    selectedSortType = value;
                    sortProvider.changeFilter(selectedSortType);
                  });
                  Navigator.pop(context);
                },
              ),

              const Divider(),
              const Text(
                "Price",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RangeSlider(
                values: RangeValues(startPrice, endPrice),
                min: minPrice,
                max: maxPrice,
                activeColor: ColorManager.pink,
                inactiveColor: Colors.grey,
                onChanged: (RangeValues values) {
                  setState(() {
                    startPrice = values.start;
                    endPrice = values.end;
                    // Optionally, handle the slider change
                  });
                },
              ),
              Container(width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    // Apply filters as needed
                    Navigator.pop(context);
                  },
                  child: const Text("Filter",
                  style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget buildRadioListTile(
      String title,
      String value,
      String? groupValue,
      ValueChanged<String?> onChanged,
      ) {
    return RadioListTile<String>(

      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: ColorManager.pink,
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(16),
               child: Row(
                 children: [
                   Expanded(flex:5,child: CustomSearch()),
                   SizedBox(width: 10,),
                   Expanded(
                     flex: 1,
                     child:InkWell(onTap: showFilterSheet,
                         child: UpperFilterBox())
                   )
                 ],
               ),
             ),
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