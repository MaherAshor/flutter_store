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

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 36, 42),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimationLimiter(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.4,
                          child: AnimationLimiter(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 850),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset: 75,
                                    child: widget,
                                  ),
                                  children: [
                                    const Text(
                                      "إنشاء حساب",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "عليك انشاء حساب للمتابعة للتطبيق",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 183, 183, 183),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyTextField(
                                      controller: firstNameController,
                                      prefix: const Icon(Icons.person),
                                      lable: const Text(
                                        "الاسم الاول",
                                      ),
                                    ),
                                    MyTextField(
                                      controller: lastNameController,
                                      prefix: const Icon(Icons.person),
                                      lable: const Text(
                                        "الاسم الاخير",
                                      ),
                                    ),
                                    MyTextField(
                                      controller: phoneController,
                                      prefix: const Icon(Icons.phone),
                                      lable: const Text(
                                        "رقم الهاتف",
                                      ),
                                    ),
                                    MyTextField(
                                      controller: emailcontroller,
                                      prefix: const Icon(
                                          Icons.alternate_email_outlined),
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
                                      lable: const Text(
                                        " كلمة المرور",
                                      ),
                                    ),
                                    MyTextField(
                                      controller: inviteCodeController,
                                      prefix: const Icon(Icons.remove_red_eye),
                                      lable: const Text(
                                        "رمز الدعوة إن وجد",
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "يمكنك الحصول على نقطتين عند استخدام رمز الدعوة",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: AnimatedButton(
                            scaleAnimation: false,
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
                            )),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
