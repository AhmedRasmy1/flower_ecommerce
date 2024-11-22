import 'package:flower_ecommerce/Features/categories/presentation/manager/all_categories_cubit.dart';
import 'package:flower_ecommerce/Features/categories/presentation/widgets/skeleton_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../products/presentation/pages/products.dart';
import '../../domain/entities/categories_entities.dart';
import '../manager/all_categories_state.dart';

class CategoryTapBar extends StatefulWidget {
  const CategoryTapBar({super.key});

  @override
  State<CategoryTapBar> createState() => _CategoryTapBarState();
}

class _CategoryTapBarState extends State<CategoryTapBar> {
  int indexTab = 0;
  late AllCategoriesViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AllCategoriesViewModel>()..doIntent(GetAllCategoriesAction());
    super.initState();
  }
@override
  void dispose() {
  viewModel.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<AllCategoriesViewModel, AllCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessAllCategoriesState) {
            List<CategoriesEntities> tabName =
                state.categoriesEntities?.categories ?? [];
              tabName.insert(0, CategoriesEntities(name: 'All'));
            /// first items /// from chatgpt
            List<Tab> tabs = tabName.map(
              (tab) {
                return Tab(
                  text: tab.name,
                );
              },
            ).toList();
            return Expanded(
              child: DefaultTabController(
                length: tabs.length,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      unselectedLabelColor: ColorManager.lightGrey3,
                      unselectedLabelStyle: getSemiBoldStyle(
                        color: ColorManager.lightGrey3,
                        fontSize: AppSize.s20,
                      ),
                      labelStyle: getSemiBoldStyle(
                        color: ColorManager.pink,
                        fontSize: AppSize.s20,
                      ),
                      isScrollable: true,
                      indicator: const UnderlineTabIndicator(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        borderSide: BorderSide(
                          color: ColorManager.pink,
                          width: 4,
                        ),
                      ),
                      indicatorColor: ColorManager.lightGrey3,
                      indicatorWeight: 3,
                      splashBorderRadius: BorderRadius.circular(20),
                      physics: const BouncingScrollPhysics(),
                      tabs: tabs,
                      onTap: (value) {
                          indexTab = value;
                      },
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: TabBarView(
                        children: tabs.map((e) {
                          int currentIndex = tabs.indexOf(e);
                          return GirdBodyOfProducts(
                            pageId: tabName[currentIndex].id ?? '',
                            page: EnumPage.category,
                            // value1: currentIndex
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SkeletonBar();

          }
        },
      ),
    );
  }
}
