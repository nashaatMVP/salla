import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_shop/shared/app/photo_link.dart';
import 'package:smart_shop/shared/theme/app_colors.dart';
import 'custom_text.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  final Size preferredSize;
  final String text;
  final bool isCart;
  final void Function() onDelete;
  const CustomAppBar({Key? key, required this.onDelete, required this.text, this.isCart = false,}): preferredSize = const Size.fromHeight(55), super(key: key);


  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return AppBar(
      centerTitle: true,
      elevation: 1,
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      toolbarHeight: preferredSize.height,
      scrolledUnderElevation: 4,
      backgroundColor: appColors.secondaryColor.withAlpha(450),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20,sigmaY : 20),
          child: Container(color: Colors.transparent,),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isCart ? SvgPicture.asset(PhotoLink.cartLink,color: appColors.primaryColor,width: 30):
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(PhotoLink.backButtonLink,color: appColors.primaryColor,width: 30),
          ),
          TextWidgets.heading(text,color: appColors.primaryColor),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              CupertinoIcons.delete,
              color: appColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
