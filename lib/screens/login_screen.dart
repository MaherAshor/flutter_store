import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fazaah/components/button_animated.dart';
import 'package:flutter_fazaah/components/text_field.dart';
import 'package:flutter_fazaah/screens/regaster_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = useTextEditingController();
    var passwordController = useTextEditingController();

    var isSecure = useState(true);
    var icon = useState(Icons.visibility);
    var count = useState(0);

    var colors = useState([
      const Color.fromARGB(255, 0, 65, 100),
      const Color.fromARGB(255, 45, 156, 216),
      const Color.fromARGB(255, 17, 138, 204),
    ]);
    useEffect(() {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (count.value == 0) {
          colors.value = [
            const Color.fromARGB(255, 17, 138, 204),
            const Color.fromARGB(255, 45, 156, 216),
            const Color.fromARGB(255, 0, 65, 100),
          ];
          count.value++;
        } else {
          colors.value = [
            const Color.fromARGB(255, 1, 53, 81),
            const Color.fromARGB(255, 45, 156, 216),
            const Color.fromARGB(255, 21, 151, 221),
          ];
          count.value = 0;
        }
      });
      return null;
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("تسجيل الدخول"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.height / 1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/login.jpg'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 850),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: AnimationLimiter(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 850),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 75,
                              child: widget,
                            ),
                            children: [
                              MyTextField(
                                controller: emailcontroller,
                                prefix:
                                    const Icon(Icons.alternate_email_outlined),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                lable: const Text(
                                  "البريد الالكتروني",
                                ),
                              ),
                              MyTextField(
                                isSecure: isSecure.value,
                                suffix: IconButton(
                                    onPressed: () {
                                      isSecure.value = !isSecure.value;
                                      icon.value = isSecure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off;
                                    },
                                    icon: Icon(icon.value)),
                                controller: passwordController,
                                prefix: const Icon(Icons.lock_rounded),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                lable: const Text(
                                  " كلمة المرور",
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  AnimatedButton(
                      scaleAnimation: true,
                      translateAnimation: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const RegasterScreen(),
                            ));
                      },
                      margin: const EdgeInsets.all(20),
                      child: const Center(
                        child: Text(
                          'تسجيل دخول',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ))
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
