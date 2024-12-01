import 'package:flower_ecommerce/Features/auth/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:flower_ecommerce/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text('ProfileView'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => LogoutConfirmationDialog(),
                        barrierDismissible: false);
                  },
                  icon: Icon(Icons.logout,))),
         // LogoutConfirmationDialog(),
        ],
      ),
    );
  }
}
