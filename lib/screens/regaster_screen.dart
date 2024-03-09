import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fazaah/components/button_animated.dart';
import 'package:flutter_fazaah/components/text_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RegasterScreen extends HookWidget {
  const RegasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var firstNameController = useTextEditingController();
    var lastNameController = useTextEditingController();
    var phoneController = useTextEditingController();
    var emailcontroller = useTextEditingController();
    var passwordController = useTextEditingController();
    var inviteCodeController = useTextEditingController();
    var isSecure = useState(true);
    var icon = useState(Icons.visibility);
    var count = useState(0);
    // var colors = useState([
    //   Color.fromARGB(255, 2, 33, 50),
    //   const Color.fromARGB(255, 17, 138, 204),
    //   Color.fromARGB(255, 62, 61, 34),
    // ]);
    // useEffect(() {
    //   Timer.periodic(const Duration(seconds: 3), (timer) {
    //     if (count.value == 0) {
    //       colors.value = [
    //         Color.fromARGB(255, 62, 61, 34),
    //         const Color.fromARGB(255, 17, 138, 204),
    //         Color.fromARGB(255, 2, 33, 50),
    //       ];
    //       count.value++;
    //     } else {
    //       colors.value = [
    //         Color.fromARGB(255, 2, 33, 50),
    //         const Color.fromARGB(255, 21, 151, 221),
    //         Color.fromARGB(255, 62, 61, 34),
    //       ];
    //       count.value = 0;
    //     }
    //   });
    // });
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("تسجيل حساب جديد"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height / 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/view1.jpg'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
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
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: AnimationLimiter(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 850),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset: 75,
                                  child: widget,
                                ),
                                children: [
                                  MyTextField(
                                    controller: firstNameController,
                                    prefix: const Icon(Icons.person),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    lable: const Text(
                                      "الاسم الاول",
                                    ),
                                  ),
                                  MyTextField(
                                    controller: lastNameController,
                                    prefix: const Icon(Icons.person),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    lable: const Text(
                                      "الاسم الاخير",
                                    ),
                                  ),
                                  MyTextField(
                                    controller: phoneController,
                                    prefix: const Icon(Icons.phone),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    lable: const Text(
                                      "رقم الهاتف",
                                    ),
                                  ),
                                  MyTextField(
                                    controller: emailcontroller,
                                    prefix: const Icon(
                                        Icons.alternate_email_outlined),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    lable: const Text(
                                      " كلمة المرور",
                                    ),
                                  ),
                                  MyTextField(
                                    controller: inviteCodeController,
                                    prefix: const Icon(Icons.remove_red_eye),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    lable: const Text(
                                      "رمز الدعوة إن وجد",
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      AnimatedButton(
                          scaleAnimation: true,
                          translateAnimation: false,
                          onTap: () {},
                          margin: const EdgeInsets.all(20),
                          child: const Center(
                            child: Text(
                              'إنشاء',
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
        ));
  }
}
