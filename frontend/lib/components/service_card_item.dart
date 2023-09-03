import 'package:flutter/material.dart';

import '../model/service_tile_model.dart';
import '../presentation/colors.dart';
import '../presentation/constants.dart';

class ServiceItemCard extends StatelessWidget {
  final double? width;
  final ServiceModel item;
  final bool? hasRating;
  const ServiceItemCard({
    super.key,
    required this.item,
    this.width = AppSizing.s_300,
    this.hasRating = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: AppSizing.s_2,
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: AppSizing.s_64 + 10,
                    width: AppSizing.s_64 + 10,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(AppSizing.s_32 + 5),
                    ),
                  ),
                  Image.asset(item.imgUrl),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizing.s_16 - 4, horizontal: AppSizing.s_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: AppSizing.s_16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: AppFontSizes.fs_8 + 2),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (hasRating == true)
                          Text("rating : ${item.rating}")
                        else
                          Container(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.double_arrow_rounded,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
