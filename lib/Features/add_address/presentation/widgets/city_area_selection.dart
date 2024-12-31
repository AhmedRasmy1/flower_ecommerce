import '../manager/add_address_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CityAreaSelection extends StatefulWidget {
  const CityAreaSelection({super.key, required this.viewModel});
  final AddAddressCubit viewModel;
  @override
  State<CityAreaSelection> createState() => _CityAreaSelectionState();
}

class _CityAreaSelectionState extends State<CityAreaSelection> {
  List<String> cities = governoratesWithCities.keys.toList();

  List<List<String>> areas = governoratesWithCities.values.toList();

  String? selectedCity;

  List<String> selectedCityAreas = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedCity = cities[0];
    selectedCityAreas = areas[cities.indexOf(selectedCity!)];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedCity,
              onChanged: (newCity) {
                setState(() {
                  selectedCity = newCity;
                  selectedCityAreas = areas[cities.indexOf(newCity!)];
                  widget.viewModel.city = newCity;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.please_select_city;
                }
                return null;
              },
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: AppLocalizations.of(context)!.city,
                labelStyle: getRegularStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s16,
                ),
                hintStyle: getRegularStyle(
                  color: ColorManager.placeHolderColor,
                  fontSize: FontSize.s14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.all(AppPadding.p18),
                enabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.black,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                errorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedErrorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                disabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
              ),
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedCityAreas.isNotEmpty ? selectedCityAreas[0] : null,
              onChanged: (newArea) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.please_select_area;
                }
                return null;
              },
              items: selectedCityAreas.map((area) {
                return DropdownMenuItem<String>(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: AppLocalizations.of(context)!.area,
                labelStyle: getRegularStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s16,
                ),
                hintStyle: getRegularStyle(
                  color: ColorManager.placeHolderColor,
                  fontSize: FontSize.s14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.all(AppPadding.p18),
                enabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.black,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                errorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                focusedErrorBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.error,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
                disabledBorder: outLintInputBorderMethod(
                  BorderSide(
                    color: ColorManager.grey,
                    width: AppSize.w1_5,
                  ),
                  const BorderRadius.all(Radius.circular(AppSize.s5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, List<String>> governoratesWithCities = {
  'Cairo': [
    'Downtown',
    'Nasr City',
    'Heliopolis',
    'Maadi',
    'New Cairo',
    'Zamalek',
    'Shubra',
    'Helwan',
    'Garden City',
    'Fifth Settlement',
    'Mokattam',
    'Hadayek El-Maadi',
    '6th October',
    'Giza',
    'Haram',
    'El-Marg',
    'El-Dokki',
    'El-Obour',
    'Ain Shams',
    'Mokattam',
    'Masaken Sheraton',
    'El-Mansheya',
    'Al-Agouza',
    'Bulaq',
    'New Heliopolis',
    'Al-Matariya',
    'Maadi City',
    'Sheikh Zayed',
    'El-Ataba'
  ],
  'Alexandria': [
    'Raml Station',
    'Moharam Bek',
    'Sidi Gaber',
    'El Montazah',
    'Karmouz',
    'Mansheya',
    'Maamoura',
    'Cleopatra',
    'Stanley',
    'Max',
    'Montaza',
    'El-Agamy',
    'Sidi Bishr',
    'Gleem',
    'Roushdy',
    'Borg El Arab',
    'Mansoura',
    'Abu Qir',
    'Kafr El-Dawwar',
    'El-Montazah',
    'Moharam Bek',
    'Borg Al Arab',
    'Shatby',
    'El-Gamil'
  ],
  'Giza': [
    'Giza City',
    '6th of October City',
    'Dokki',
    'Mohandessin',
    'El-Haram',
    'Zamalek',
    'New Giza',
    'Sheikh Zayed',
    'October Gardens',
    'Hossary',
    'Imbaba',
    'Kerdasa',
    'El-Mohandiseen',
    '6th of October',
    'Faisal',
    'Haram',
    'Oasis Road',
    'Badr City',
    'Abu El-Matamir',
    'Oasis',
    'Shiekh Zayed',
    'Giza Plateau'
  ],
  'Shubra El-Kheima': [
    'El-Haram',
    'El-Obour',
    'Shubra',
    'El-Matariya',
    'Tora',
    'Badr City',
    'Qalyub',
    'El-Khanka',
    'El-Marg',
    'Al-Maadi',
    'El-Zawiya',
    'Al-Shorouk',
    'El-Monofeya'
  ],
  'Port Said': [
    'Port Said City',
    'El-Gamil',
    'Abo Hadr',
    'El-Dakahlia',
    'Al-Gharbia',
    'Ras El-Bar',
    'El-Salam',
    'El-Mahmoudiya',
    'West Port Said',
    'East Port Said',
    'Mansoura',
    'Sheikh Zuweid',
    'Ras Shukair',
    'Roud El Farag',
    'Al-Tour'
  ],
  'Suez': [
    'Suez City',
    'Port Tawfiq',
    'Ain Sokhna',
    'Suez Canal',
    'El-Tour',
    'Nubaria',
    'Tantora',
    'Al-Zakazik',
    'El-Fayoum',
    'Hurghada',
    'Shaab',
    'Makadi Bay',
    'Ras Gharib',
    'Sidi Abdel Rahman',
    'Khosous',
    'Badr City'
  ],
  'Mansoura': [
    'Mansoura City',
    'El-Tall El-Kebir',
    'El-Mahalla',
    'Dikirnis',
    'Talkha',
    'Sherbin',
    'Sinfi',
    'Kafr El-Dawwar',
    'El-Basateen',
    'Hassan',
    'El-Sahel',
    'El-Qalyubia',
    'Ashmoun'
  ],
  'Tanta': [
    'Tanta City',
    'El-Khanka',
    'Kafr El-Zayat',
    'Mahalla',
    'Basyoun',
    'El-Santa',
    'Kafr El-Malla',
    'Al-Gharbia',
    'Al-Shorouk',
    'El-Khanka',
    'El-Fayoum'
  ],
  'Asyut': [
    'Asyut City',
    'Abnoub',
    'El-Fayoum',
    'El-Mahalla',
    'El-Dahshur',
    'Qous',
    'Banha',
    'Naga Hammadi',
    'Manfalut',
    'Akhmim',
    'Esna',
    'Tima',
    'Gerga'
  ],
  'Ismailia': [
    'Ismailia City',
    'El-Tal El-Kebir',
    'Abu Sultan',
    'El-Obour',
    'El-Dakahlia',
    'Al-Kantara',
    'Port Said',
    'Zagazig',
    'Mahmoudia',
    'Banha',
    'Fayed'
  ],
  'Fayoum': [
    'Fayoum City',
    'Tamia',
    'Itesal',
    'Sannour',
    'Sharkia',
    'El-Badari',
    'Wasta',
    'El-Mahmoudiya',
    'El-Said',
    'Ibrahimiya',
    'Kafr El-Sheikh'
  ],
  'Zagazig': [
    'Zagazig City',
    'Kafr Saqr',
    'Abu Hammad',
    'Belbes',
    'El-Mahalla',
    'Sharkia',
    'Al-Maadi',
    'Dikirnis',
    'El-Santa',
    'Kafr Shukr',
    'Shibin El-Kom',
    'Tanta'
  ],
  'Damanhour': [
    'Damanhour City',
    'Kom Hamada',
    'Kafr El-Dawwar',
    'Mahalla',
    'El-Buheira',
    'Abu Qir',
    'El-Sahel',
    'Mansoura',
    'Zagazig',
    'Ismailia',
    'El-Mahmoudiya'
  ],
  'Minya': [
    'Minya City',
    'Samalut',
    'Beni Mazar',
    'El-Edwa',
    'Banha',
    'Abu Kharb',
    'El-Fayoum',
    'Badr',
    'Shibin',
    'Hawamdiya',
    'El-Mahalla',
    'Giza',
    'El-Said'
  ],
  'Beni Suef': [
    'Beni Suef City',
    'El-Wasta',
    'Nasser',
    'Fayoum',
    'Basyoun',
    'Mahmoudia',
    'Zagazig',
    'Damanhour',
    'Badr',
    'Nasser',
    'Sidi Gaber'
  ],
  'Qena': [
    'Qena City',
    'Nagaa Hammadi',
    'Dandara',
    'Keffaya',
    'El-Qusiya',
    'Beni Mazar',
    'Abnoub',
    'Nuba',
    'Tima',
    'Manfalut',
    'Sohag',
    'Shibin El-Kom',
    'Sakha'
  ],
  'Aswan': [
    'Aswan City',
    'Nubia',
    'Kom Ombo',
    'Ibrahimia',
    'Edfu',
    'Wadi El-Natrun',
    'El-Gabal El-Ahmar',
    'Beni Suef',
    'Thebes',
    'New Aswan',
    'Hersh'
  ],
  'Luxor': [
    'Luxor City',
    'Esna',
    'Armant',
    'Karnak',
    'El-Tarif',
    'Hatshepsut',
    'West Bank',
    'Qurna',
    'New Luxor',
    'Karnak Temples',
    'Thebes',
    'Luxor Temple'
  ],
  'Sohag': [
    'Sohag City',
    'Gerga',
    'Tima',
    'El-Badari',
    'El-Mahalla',
    'Al-Sahel',
    'El-Khanka',
    'Shibin El-Kom',
    'Hawamdiya',
    'Badr',
    'Ashmoun'
  ],
  'Damietta': [
    'Damietta City',
    'New Damietta',
    'Ras El Bar',
    'Kafr El-Batikh',
    'El-Mansoura',
    'Port Said',
    'Al-Salam',
    'Belbes'
  ],
  'Sharkia': [
    'Zagazig',
    'Belbes',
    'Faqus',
    'El-Santa',
    'El-Khanka',
    'Al-Basateen',
    'Sharkia',
    'Al-Sahel',
    'El-Shorouk',
    'Hawamdiya',
    'El-Tebeen'
  ],
  'Mersa Matruh': [
    'Mersa Matruh City',
    'El-Alamein',
    'El-Hamra',
    'Makadi Bay',
    'Sidi Abdel Rahman',
    'Al-Dabaa',
    'Alexandria'
  ],
  'Red Sea': [
    'Hurghada',
    'Sharm El Sheikh',
    'Soma Bay',
    'El-Quseir',
    'Safaga',
    'Marsa Alam',
    'Nuweiba',
    'Taba',
    'Dahab'
  ],
  'North Sinai': [
    'Arish',
    'Sheikh Zuweid',
    'Rafah',
    'Bir El-Abd',
    'El-Sheikh Zuweid',
    'Al-Qantara',
    'Ras Sidr'
  ],
  'South Sinai': [
    'Sharm El Sheikh',
    'Dahab',
    'Nuweiba',
    'Taba',
    'Ras Sidr',
    'Saint Catherine',
    'Taba Heights',
    'Abu Galum',
    'Ras Mohammed'
  ],
  'Matrouh': [
    'Mersa Matruh',
    'El-Alamein',
    'Sidi Abdel Rahman',
    'Ras El-Hekma',
    'Dabaa',
    'Cleopatra Bay',
    'Al-Dabaa',
    'El-Hamra',
    'Mersa Matruh City'
  ],
  'Beheira': [
    'Damanhour',
    'Kafr El-Dawwar',
    'Rashid',
    'Wadi El-Natrun',
    'Shubrakhit',
    'Edco',
    'Badr',
    'Abu Hadr',
    'Kafr El-Batikh'
  ],
  'Kafr El Sheikh': [
    'Kafr El-Sheikh City',
    'Desouq',
    'Fuwah',
    'Riyad',
    'Basyoun',
    'Sidi Salem',
    'Al-Hamool',
    'Qalyub',
    'Barakat'
  ]
};
