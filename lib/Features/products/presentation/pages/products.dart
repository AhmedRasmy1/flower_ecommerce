import 'package:flower_ecommerce/Features/products/presentation/manager/all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/ProductsEntities.dart';
import '../manager/all_products_cubit.dart';
import '../widgets/cart_product.dart';
import '../widgets/skeleton_body.dart';

class GirdBodyOfProducts extends StatefulWidget {
  const GirdBodyOfProducts({
    super.key,
    required this.page,
    required this.pageId,
  });

  final EnumPage page;
  final String pageId;

  @override
  State<GirdBodyOfProducts> createState() => _GirdBodyOfProductsState();
}

class _GirdBodyOfProductsState extends State<GirdBodyOfProducts> {
  late AllProductsViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AllProductsViewModel>()..doIntent(GetAllProductsAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("page id ---------------- ${widget.pageId}");

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<AllProductsViewModel, AllProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },

        builder: (context, state) {
          if (state is SuccessAllProductsState) {
            List<ProductsEntities> allData =
            /// FROM CHATGPT
            state.categoriesEntities?.products ?? [];
            List<ProductsEntities> filteredByOccasion =
            allData.where((product) {
              if (widget.pageId.isEmpty) {
                return true;
              }
              if (widget.page.name == 'Category') {
                return product.category == widget.pageId;
              } else if (widget.page.name == 'Occasion') {
                return product.occasion == widget.pageId;
              } else {
                return true;
              }
            }).toList();

            return LayoutBuilder(
              builder: (context, constraints) {
                double aspectRatio = (constraints.maxWidth > 500) ?0.67: 0.6 ;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth > 500?3:2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: aspectRatio
                    ),
                    itemCount: filteredByOccasion.length,
                    itemBuilder: (context, index) {
                      return filteredByOccasion.isNotEmpty
                          ? InkWell(
                        onTap: () {
                          /// go to details
                          /// go to details
                          /// go to details
                          /// go to details
                          /// go to details
                        },
                            child: CartProduct(
                                                    productsEntities: filteredByOccasion[index],
                                                  ),
                          )
                          : const SkeletonBody();
                    },
                  ),
                );
              },

            );
          } else {
            return const SkeletonBody();
          }
        },
      ),
    );
  }
}

enum EnumPage {
  category('Category'),
  occasion('Occasion');

  final String name;

  const EnumPage(this.name);

  String getName() {
    return name;
  }
}


Map<String, dynamic> getGridConfig(double screenWidth) {
  int crossAxisCount = 2; // افتراضي 2 عمود
  if (screenWidth > 600) {
    crossAxisCount = 3; // 3 أعمدة للشاشات الكبيرة (مثل التابلت)
  }
  if (screenWidth > 1200) {
    crossAxisCount = 4; // 4 أعمدة للشاشات الكبيرة جدًا (مثل الشاشات الكبيرة)
  }

  double aspectRatio = 0.67; // القيمة الافتراضية
  if (screenWidth > 600) {
    aspectRatio = 0.75; // يمكن تعديل النسبة للأعمدة الأكبر
  }

  return {
    'crossAxisCount': crossAxisCount,
    'aspectRatio': aspectRatio,
  };
}