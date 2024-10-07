import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/detail_screen.dart';
import 'package:stellar_store/ui/home/components/categories.dart';
import 'package:stellar_store/ui/home/components/item_card.dart';

class CatalougeScreen extends StatefulWidget {
  const CatalougeScreen({super.key});

  @override
  State<CatalougeScreen> createState() => _CatalougeScreenState();
}

class _CatalougeScreenState extends State<CatalougeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hi, Zaa",
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Special Offer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75
                ),
                itemCount: product.length,
                itemBuilder: (context, index) => ItemCard(
                  product: product[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product[index])
                    )
                  )
                ),
              
              ),
            )
          )
        ],
      ),
    );
  }
}