import 'package:flower_ecommerce/Features/notifications_list/presentation/widgets/notification_item.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 10),
              child: CustomAppBar(
                title: AppLocalizations.of(context)!.notification,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => NotificationItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
