import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_shop/shared/app/custom_text.dart';
import '../../search/search_screen.dart';
import '../../../shared/theme/app_colors.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          SearchScreen.routName,
          arguments: name,
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                image,
                width: 150,
                height: 150,
              ),
            ),
          ),
          const Gap(5),
          TextWidgets.bodyText1(name,fontWeight: FontWeight.w600,color: appColors.primaryColor,fontSize: 10),
        ],
      ),
    );
  }
}
