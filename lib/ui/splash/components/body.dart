import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_store/const.dart';
import 'package:stellar_store/ui/auth/login_screen.dart';
import 'package:stellar_store/ui/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  // ViewPager (untuk pindah halaman)
  PageController _pageController = PageController();

  // Dasar pengambilan data dari API
  List<Map<String, String>> splashData = [
    {
      "title": "Welcome There",
      "image": "assets/illustration/splash1.png",
      "text":
          "A wide selection of unique gifts, from fresh \n flowers to custom items. You'll like all.",
    },
    {
      "title": "Super Fast",
      "image": "assets/illustration/splash2.png",
      "text":
          "Enjoy great features like gift recommendations, \n free gift wrapping, and fast delivery.",
    },
    {
      "title": "A Lot of Discount",
      "image": "assets/illustration/splash3.png",
      "text":
          "Don't miss our interesting promotions! \n Get discounts up to 50% for your first purchase.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Expanded: Mengisi celah yang kosong (tergantung row atau column)
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                // Akan membawa widget ke tengah (kordinat 0.0)
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      // Initial state for statefulWidget behaviour.
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"]!,
                        title: splashData[index]["title"]!,
                        text: splashData[index]["text"]!)),
              ),
            ),

            // Logic untuk dots indicator dengan method extraction
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length, 
                  (index) => _dotsIndicator(index: index)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding * 5
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: defaultPadding),
                    width: 58,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(borderRadiusSizeMine)
                    ),
                    child: IconButton(
                      onPressed: () {
                        _pageController.animateToPage(currentPage - 1, 
                        duration: animationDuration, curve: Curves.ease);
                      }, 
                      icon: SvgPicture.asset(
                        'assets/icons/fi-rr-angle-small-left.svg',
                        colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn)
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [shadowMine]
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shadowColor: Colors.transparent, // Warna shadow  
                          elevation: 0, // Tinggi bayangan  
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadiusSizeMine),
                          ),                          
                        ),
                          onPressed: () {
                            if (currentPage == splashData.length - 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen()
                                )
                              );
                            } else {
                              _pageController.animateToPage(currentPage + 1,
                                  duration: animationDuration, curve: Curves.ease);
                            }
                          }, // function placeholder (kosongan)
                          child: Text(
                            currentPage == splashData.length - 1
                                ? "Get Started"
                                : "Next",
                            style: buttonColorBgStyle
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Dots indicator-nya
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // kondisi ? kondisi benar : kondisi salah
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
      duration: animationDuration,
    );
  }
}

/**
 * 
 * Jika mau memanggil argumen yang dimana argumen tersebut
 * berfungsi untuk mewakili sebuah integer maka gunakan 
 * argumen value.
 * 
 */
