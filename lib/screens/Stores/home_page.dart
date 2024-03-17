import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class StoresHomePage extends HookWidget {
  const StoresHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var currentindex = useState(0);
    var pageController = PageController(
        keepPage: true, initialPage: currentindex.value, viewportFraction: 1);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 36, 42),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 255, 210, 63),
        centerTitle: false,
        title: const Text(
          "Smart win",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 210, 63),
              fontStyle: FontStyle.italic),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "نقاطي:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 210, 63),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ))
        ],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 36),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: SlidingClippedNavBar.colorful(
          backgroundColor: Colors.transparent,
          barItems: [
            BarItem(
              title: currentindex.value == 0 ? "المتاجر" : "",
              icon: Icons.store_sharp,
              inactiveColor: const Color.fromARGB(255, 255, 210, 63),
              activeColor: const Color.fromARGB(255, 255, 210, 63),
            ),
            BarItem(
              title: currentindex.value == 1 ? "المنتجات" : "",
              icon: Icons.production_quantity_limits,
              inactiveColor: const Color.fromARGB(255, 255, 210, 63),
              activeColor: const Color.fromARGB(255, 255, 210, 63),
            ),
            BarItem(
              title: currentindex.value == 2 ? "متجري" : "",
              icon: Icons.person,
              inactiveColor: const Color.fromARGB(255, 255, 210, 63),
              activeColor: const Color.fromARGB(255, 255, 210, 63),
            ),
          ],
          onButtonPressed: (index) {
            pageController.animateToPage(currentindex.value = index,
                duration: const Duration(milliseconds: 700),
                curve: Curves.linear);
          },
          selectedIndex: currentindex.value,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "المتاجر",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "lib/images/store.jpg",
                            ),
                            fit: BoxFit.cover),
                        color: const Color.fromARGB(255, 68, 68, 65),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      height: MediaQuery.of(context).size.height / 11,
                      clipBehavior: Clip.none,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sears",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "السعودية العربية",
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "اكسسوارات هواتف وعطورات",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "lib/images/store.jpg",
                            ),
                            fit: BoxFit.cover),
                        color: const Color.fromARGB(255, 68, 68, 65),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      height: MediaQuery.of(context).size.height / 11,
                      clipBehavior: Clip.none,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sears",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "السعودية العربية",
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "اكسسوارات هواتف وعطورات",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stor(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget Stor(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    "lib/images/store.jpg",
                  ),
                  fit: BoxFit.cover),
              color: const Color.fromARGB(255, 68, 68, 65),
              borderRadius: BorderRadius.circular(25),
            ),
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            height: MediaQuery.of(context).size.height / 11,
            clipBehavior: Clip.none,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sears",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "السعودية العربية",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "اكسسوارات هواتف وعطورات",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
