import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../localization/locale_cubit.dart';
import '../../../auth/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../domain/entities/profile_entity.dart';
import 'option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            OptionItem(
              icon: Icons.event_note_outlined,
              text: AppLocalizations.of(context)!.myOrders,
              imageIconExists: true,
            ),
            OptionItem(
              icon: Icons.location_on,
              text: AppLocalizations.of(context)!.savedAddress,
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
                      Text(AppLocalizations.of(context)!.notification,
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              Transform(
                alignment: Alignment.center,
                transform:
                    CacheService.getData(key: CacheConstants.defaultLanguage) ==
                            'ar'
                        ? Matrix4.rotationY(3.1416)
                        : Matrix4.identity(),
                child:
                    const ImageIcon(AssetImage("assets/images/side_arrow.png")),
              )
            ]),
            const Divider(thickness: 1, color: Colors.grey),
            // const OptionItem(
            //   icon: Icons.language,
            //   text: 'Language',
            //   trailingText: 'English',
            //   imageIconExists: false,
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/language_icon.svg',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      String dropdownValue =
                          context.read<LocaleCubit>().state.languageCode;
                      return DropdownButton<String>(
                        value: dropdownValue,
                        iconEnabledColor: ColorManager.pink,
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(
                              'English',
                              style: TextStyle(color: ColorManager.pink),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text(
                              'العربية',
                              style: TextStyle(color: ColorManager.pink),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              dropdownValue = value;
                            });
                            context.read<LocaleCubit>().changeLanguage(value);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.aboutUs,
              imageIconExists: true,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.termsAndConditions,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesManager.registerRoute);
                      },
                      child: OptionItem(
                        icon: Icons.person_add,
                        text: AppLocalizations.of(context)!.signUp,
                        imageIconExists: false,
                      ),
                    )),
                const Icon(
                  Icons.person_add,
                  size: 30,
                )
              ],
            ),
          ],
        ),
      ),
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
