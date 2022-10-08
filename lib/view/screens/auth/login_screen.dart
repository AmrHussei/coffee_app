import 'package:flutter/material.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/auth/auth_text_form_filed.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              text: 'LOG',
              fontSize: 26.sp,
              fontWeight: FontWeight.w500,
              color: mainColor,
            ),
            const SizedBox(
              width: 4,
            ),
            TextUtils(
              text: 'IN',
              fontSize: 26.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 625.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Image.asset('images/logo.png'),
                      ),
                      SizedBox(
                        height: 30.h,
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
                          size: 28.sp,
                        ),
                        suffixIcon: const Text(''),
                        hintText: 'Enter your email',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFormFiled(
                          controller: passwordController,
                          obscureText: authController.isVisability,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'The password must be at least 6 characters long';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 28.sp,
                            color: mainColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                authController.visabilityFun();
                              },
                              icon: authController.isVisability
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                          hintText: 'Enter your password',
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgetPassword);
                          },
                          child: const Text(
                            'Forget password ?',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19.2,
                      ),
                      SizedBox(height: 100.h),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String email = emailController.text;
                              String password = emailController.text.trim();
                              authController.loginUsingFirebase(
                                email: email,
                                password: password,
                              );
                            }
                          },
                          text: 'LOG IN',
                        );
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextUtils(
                        text: 'OR',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                              onTap: () {
                                authController.googleSinUpApp();
                              },
                              child: SizedBox(
                                  height: 35.h,
                                  width: 35.w,
                                  child: Image.asset('images/google.png')),
                            );
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
                onPressed: () {
                  Get.toNamed(Routes.signUpScreen);
                },
                text: "Don't have an account ",
                text2: 'sign up'),
          ],
        ),
      ),
    ));
  }
}
