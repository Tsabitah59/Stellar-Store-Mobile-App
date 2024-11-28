import 'package:flutter/material.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/models/products.dart';
import 'package:stellar_store/ui/detail/detail_screen.dart';
import 'package:stellar_store/ui/explore/components/categories.dart';
import 'package:stellar_store/ui/explore/components/item_card.dart';
import 'package:stellar_store/ui/home/components/carousel_section.dart';
import 'package:stellar_store/ui/home/components/home_categories.dart';
import 'package:stellar_store/ui/main/main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                        enabledBorder:enableOutlineInputBorderMine,
                        focusedBorder: focusedOutlineInputBorderMine
                        
                      ),
                    )
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusSizeMine),
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

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CarouselSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Categories",
                      style: titleStyle
                    ),
                  ),
                  const HomeCategories(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "New Arrival",
                      style: titleStyle
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
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
          ),
        ],
      )
    );
  }
}