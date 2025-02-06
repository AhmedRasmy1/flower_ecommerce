import 'package:flower_ecommerce/core/resources/style_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../view_model/orders_cubit.dart';
import '../widgets/orders_page_body.dart';


class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late OrdersViewModel ordersViewModel;
  late TabController _tabController;

  @override
  void initState() {
    ordersViewModel = getIt.get<OrdersViewModel>();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ordersViewModel
        ..getUserOrders(
            'Bearer ${CacheService.getData(key: CacheConstants.userToken)}'),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.myOrders,
            style: getSemiBoldStyle(fontSize: 20,),),
          backgroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: ColorManager.pink,
            labelColor: ColorManager.pink,
            unselectedLabelColor: Colors.grey,
            labelStyle: getSemiBoldStyle(fontSize: 16),
            tabs: const [
              Tab(text: AppStrings.active),
              Tab(text: AppStrings.complete),
            ],
          ),
        ),
        body: MyOrdersPageBody(tabController: _tabController,),
      ),
    );
  }
}

