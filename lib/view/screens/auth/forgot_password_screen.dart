import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_filed.dart';
import '../../widgets/text_utils.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text(
            'Forget password',
            style: TextStyle(
              color: mainColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() {
              Get.back();
            }),
            color: Colors.black,
          )),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Center(
                    child: TextUtils(
                        text:
                            "if you want to recover your account please provide your email",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 19.2,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'images/forget.png',
                      width: MediaQuery.of(context).size.width / 1.8,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  AuthTextFormFiled(
                    controller: emailController,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Enter valid email';
                      }
                    },
                    prefixIcon: Icon(
                      Icons.email,
                      color: mainColor,
                      size: 27.h,
                    ),
                    suffixIcon: const Text(''),
                    hintText: 'Enter your email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text;

                          authController.resetPassword(email);
                        }
                      },
                      text: 'SEND',
                    );
                  }),
                ],
              ),
            ),
          )),
    ));
  }
}
