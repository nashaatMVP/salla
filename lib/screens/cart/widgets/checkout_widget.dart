import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/shared/app/custom_container.dart';
import '../../../shared/app/constants.dart';
import '../provider/cart_provider.dart';
import '../../../providers/products_provider.dart';
import '../../../shared/app/custom_text.dart';
import '../../../shared/theme/app_colors.dart';
import '../checkout_screen.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productsProvider = Provider.of<ProductProvider>(context);
    final appColors = Theme.of(context).extension<AppColors>()!;
    return BottomSheet(
        elevation: 10,
        backgroundColor: appColors.secondaryColor,
        onClosing: () {},
        builder: (e) =>  InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutScreen(),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: CustomContainer(
              color: blueColor,
              height: 55,
              radius: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgets.bodyText1("${cartProvider.getQty()} items",fontSize: 12,color: whiteColor),
                        TextWidgets.bodyText1("AED ${cartProvider.getTotal(productProvider: productsProvider).toStringAsFixed(2)}",fontSize: 15,fontWeight: FontWeight.bold,color: whiteColor),
                      ],
                    ),
                    TextWidgets.subHeading("CHECKOUT",color: whiteColor,fontSize: 17),
                    kGap5,
                    const CustomContainer(
                      child: Icon(CupertinoIcons.arrow_right_square_fill , color: Colors.white,size: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
