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
  int _selectedIndex = 0;  

  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  

  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12
              ),
            ),
            Text(
              "Bogor, Indonesia",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: textColor
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications_none_outlined)
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Flower Bouquet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28
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

      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
          // Untuk Mengatur BoxShadow
          boxShadow: [  
            BoxShadow(  
              color: Colors.grey.withOpacity(0.2),  
              spreadRadius: 5,  
              blurRadius: 7,  
              offset: const Offset(0, 3), // Pergerakan shadow  
            ),  
          ], 
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Explore"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_sharp),
              label: "Chat"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined
              ),
              label: "Profile"
            ),
          ],
          iconSize: 30,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}