import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/state-management/cart_provider.dart';
import 'package:stellar_store/ui/detail/components/cart_counter.dart';


// Trigger utama untuk menambahkan item ke keranjang
class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusSizeMine),
              border: Border.all(color: primaryColor),
            ),

            // Icon button
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/fi-rr-shopping-cart-add.svg',
                colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn)
              ),
              onPressed: () {
                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity,
                );
                showToast(context, product.title);
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  maximumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusSizeMine))
                ),
                onPressed: () {},
                child: Text(
                  "Checkout Now",
                  style: buttonColorBgStyle
                )
              ),
            )
          )
        ],
      ),
    );
  }
}

void showToast(BuildContext context, String title) {  
  FToast fToast = FToast();  
  fToast.init(context);  

  Widget toast = Padding(
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: Container(  
      width: double.infinity,  
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(borderRadiusSizeMine),  
        color: Colors.white,  
        boxShadow: [shadowDieMine]
      ),  
      padding: const EdgeInsets.all(defaultPadding),  
      child: ListTile(
        leading: Image.asset(
          'assets/illustration/cart.png'
        ),
        title: Text(
          "Added To Cart",
          style: titleStyle
        ),
        subtitle: Text(
          "Successfully add $title to cart!",  
        ),
      )
    )
  );  

  fToast.showToast(  
    child: toast,  
    gravity: ToastGravity.BOTTOM,  
    toastDuration: const Duration(seconds: 3),  
  );  
}  