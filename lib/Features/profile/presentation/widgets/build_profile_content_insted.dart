import '../../../auth/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../domain/entities/profile_entity.dart';
import 'option_item.dart';

Widget buildProfileContentInstent(
    BuildContext context, ProfileEntity? profile) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      // Profile Section
      Center(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/icon__avatar.png'), // Replace with your image
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profile?.user?.firstName ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              profile?.user?.email ?? '',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      // Options List
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const OptionItem(
              icon: Icons.event_note_outlined,
              text: 'My orders',
              imageIconExists: true,
            ),
            const OptionItem(
              icon: Icons.location_on,
              text: 'Saved address',
              imageIconExists: true,
            ),
            const Divider(thickness: 1, color: Colors.grey),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Switch(
                        activeTrackColor: Colors.pink,
                        value: true,
                        onChanged: (value) {},
                        activeColor: ColorManager.white,
                        inactiveThumbColor: Colors.pink,
                      ),
                      const SizedBox(width: 10),
                      const Text('Notification',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              const ImageIcon(AssetImage("assets/images/side_arrow.png"))
            ]),
            const Divider(thickness: 1, color: Colors.grey),
            const OptionItem(
              icon: Icons.language,
              text: 'Language',
              trailingText: 'English',
              imageIconExists: false,
            ),
            const OptionItem(
              text: 'About us',
              imageIconExists: true,
            ),
            const OptionItem(
              text: 'Terms & conditions',
              imageIconExists: true,
            ),
            const Divider(thickness: 1, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const LogoutConfirmationDialog(),
                        barrierDismissible: false,
                      );
                    },
                    child: const OptionItem(
                      icon: Icons.logout,
                      text: 'Logout',
                      imageIconExists: false,
                    )),
                const Icon(Icons.logout)
              ],
            ),
          ],
        ),
      ),
      const Spacer(),
      // Footer
      const Center(
        child: Text(
          'v 6.3.0 - (446)',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
