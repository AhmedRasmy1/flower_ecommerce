import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/resources/color_manager.dart';

class SkeletonSavedAddress extends StatelessWidget {
  const SkeletonSavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Text('sdfghjklfghjkl'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        width: 343,
                        height: 83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 14,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/location.png"),
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' addressesEntity.city!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 170,
                                  // ),
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19),
                                    child: ImageIcon(
                                      AssetImage("assets/images/pen.png"),
                                      size: 24,
                                      color: ColorManager.placeHolderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'ddressesEntity.street!',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.placeHolderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    '   AppLocalizations.of(context)!.add_new_address',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
