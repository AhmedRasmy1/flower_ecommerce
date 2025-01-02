import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../localization/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../auth/presentation/widgets/logout_confirmation_dialog.dart';
import '../../../../core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../domain/entities/profile_entity.dart';
import 'option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget buildProfileContent(BuildContext context, ProfileEntity? profile) {
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
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesManager.editProfileRoute,
                          arguments: profile);
                    },
                    child: const ImageIcon(
                        AssetImage("assets/images/noto_pen.png")))
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
            InkWell(
              onTap:(){
                Navigator.pushNamed(context, RoutesManager.ordersView);
              },
              child: OptionItem(
                icon: Icons.event_note_outlined,
                text: AppLocalizations.of(context)!.myOrders,
                imageIconExists: true,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.savedAddress);
              },
              child: OptionItem(
                icon: Icons.location_on,
                text: AppLocalizations.of(context)!.savedAddress,
                imageIconExists: true,
              ),
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesManager.aboutUsPageRoute,
                );
              },
              child: OptionItem(
                text: AppLocalizations.of(context)!.aboutUs,
                imageIconExists: true,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesManager.termsAndConditionsPageRoute,
                );
              },
              child: OptionItem(
                text: AppLocalizations.of(context)!.termsAndConditions,
                imageIconExists: true,
              ),
            ),
            Divider(thickness: 1, color: Colors.grey),
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
                    child: OptionItem(
                      icon: Icons.logout,
                      text: AppLocalizations.of(context)!.logout,
                      imageIconExists: false,
                    )),
                const Icon(
                  Icons.logout,
                  size: 30,
                )
              ],
            ),
            const Center(
              child: Text(
                'v 6.3.0 - (446)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      // Footer

      const SizedBox(height: 10),
    ],
  );
}
