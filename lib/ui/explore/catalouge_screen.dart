import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/detail_screen.dart';
import 'package:stellar_store/ui/explore/components/categories.dart';
import 'package:stellar_store/ui/explore/components/item_card.dart';

class CatalougeScreen extends StatefulWidget {
  const CatalougeScreen({super.key});

  @override
  State<CatalougeScreen> createState() => _CatalougeScreenState();
}

// <> adalah lambang generic
class _CatalougeScreenState extends State<CatalougeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search Anything",
                        suffixIcon: const Icon(
                          Icons.search,
                          color: secondaryColor,
                        ),
                        hintStyle: const TextStyle(color: secondaryColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Colors.grey.shade300
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                        
                      ),
                    )
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor
                  ),
                  child: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: Colors.white,
                    )
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Flower Bouquet",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),
                  ),
                  const Categories(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}