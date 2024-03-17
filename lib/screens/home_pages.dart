import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fazaah/components/button_animated.dart';
import 'package:flutter_fazaah/screens/Stores/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider.builder(
              carouselController: CarouselController(),
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 0),
                          offset: Offset(-3.7, -3.7),
                          blurRadius: 3,
                          spreadRadius: 0.0,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 0),
                          offset: Offset(4.7, 4.7),
                          blurRadius: 3,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      "lib/images/sss.jpg",
                    ));
              },
              options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast,
                  ),
                  viewportFraction: 1,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 3.4)),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: const Color.fromARGB(255, 68, 68, 65),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: const ListTile(
              title: Text(
                "استبدال نقاطي",
                style: TextStyle(color: Colors.white),
              ),
              leading: CircleAvatar(
                  child: Icon(
                Icons.repeat_rounded,
                color: Colors.white,
              )),
              subtitle: Text(""),
              trailing: Text(
                "350/1000",
                style: TextStyle(color: Color.fromARGB(255, 255, 210, 63)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const StoresHomePage(),));
            },
            child: Card(
              color: const Color.fromARGB(255, 68, 68, 65),
              elevation: 10,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: const ListTile(
                title: Text(
                  "المتاجر",
                  style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                    child: Icon(
                  Icons.storefront_outlined,
                  color: Colors.white,
                )),
                subtitle: Text(
                  "يمكنك انشاء متجر و رؤية المتاجر الاخرى",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                // trailing: Text(
                //   "350/1000",
                //   style: TextStyle(color: Color.fromARGB(255, 255, 210, 63)),
                // ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: AnimatedButton(
                margin: const EdgeInsets.all(10),
                scaleAnimation: false,
                translateAnimation: false,
                child: const Center(
                  child: Text(
                    'العب الان',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "منتجات رائجة:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAlias,
                  color: const Color.fromARGB(255, 68, 68, 65),
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
