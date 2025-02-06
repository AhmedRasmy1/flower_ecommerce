import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';

class SkeletonOrder extends StatelessWidget {
  const SkeletonOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.only(
                top: AppSize.s20, left: AppSize.s24, right: AppSize.s24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s10),
                side: BorderSide(color: Colors.grey)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s8),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/bouqeut2.png',
                    // Replace with your image asset
                    height: 140,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: AppSize.s16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order number 5555",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                          const SizedBox(height: AppSize.s4),
                          Text("EGP 232323",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          Text("23232323}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: AppSize.s16,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.pink,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s20)),
                                ),
                                onPressed: () {},
                                child: Text("Reorder",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
