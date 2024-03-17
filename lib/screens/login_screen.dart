import 'package:flutter/material.dart';
import 'package:flutter_fazaah/components/button_animated.dart';
import 'package:flutter_fazaah/components/text_field.dart';
import 'package:flutter_fazaah/screens/regaster_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = useTextEditingController();
    var passwordController = useTextEditingController();
    var isSecure = useState(true);
    var icon = useState(Icons.visibility);
    var empty = useState(false);

    GlobalKey<FormState> formkey = GlobalKey();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 36, 36, 42),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "تسجيل الدخول",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "سجل دخولك للمتابعة للتطبيق",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromARGB(255, 183, 183, 183),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "البريد الالكتروني",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "استخدام رقم الهاتف",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 210, 63),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formkey,
                        child: MyTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "null";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          prefix: const Icon(Icons.alternate_email_outlined),
                          hint: "ادخل بريدك الالكتروني",
                        ),
                      ),
                      const Text(
                        "كلمة المرور",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      MyTextField(
                        keyboardType: TextInputType.visiblePassword,
                        isSecure: isSecure.value,
                        suffix: GestureDetector(
                            onTap: () {
                              isSecure.value = !isSecure.value;
                              icon.value = isSecure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off;
                            },
                            child: Icon(icon.value)),
                        controller: passwordController,
                        prefix: const Icon(Icons.lock_rounded),
                        hint: " كلمة المرور",
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "هل نسيت كلمة المرور؟",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                child: AnimatedButton(
                    scaleAnimation: false,
                    translateAnimation: false,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        empty.value = true;
                      } else {
                        empty.value = false;
                      }
                    },
                    margin: const EdgeInsets.symmetric(),
                    child: const Center(
                      child: Text(
                        'تسجيل دخول',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "لا تملك حساب ؟",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegasterScreen()));
                      },
                      child: const Text(
                        "انشاء حساب",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 210, 63),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
