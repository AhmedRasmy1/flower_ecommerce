import '../manager/fetch_user_cart/fetch_user_cart_view_model.dart';
import 'widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchCartViewModel = GetIt.instance.get<FetchUserCartViewModel>();
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => fetchCartViewModel..fetchUserCart(),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
