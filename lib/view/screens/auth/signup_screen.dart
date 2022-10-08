import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_filed.dart';
import '../../widgets/auth/check_box_widget.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
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
              text: 'SIGN',
              fontSize: 26.sp,
              fontWeight: FontWeight.w500,
              color: mainColor,
            ),
            const SizedBox(
              width: 4,
            ),
            TextUtils(
              text: 'UP',
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
              width: double.infinity,
              height: 625.h,
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
                        controller: nameController,
                        obscureText: false,
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Icon(
                          Icons.person,
                          color: mainColor,
                          size: 28.sp,
                        ),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      SizedBox(
                        height: 20.h,
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
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 20.h,
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
                          hintText: 'Password',
                        );
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      CheckBoxWidget(),
                      SizedBox(height: 80.h),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (authController.isCheckBox == false) {
                                Get.snackbar('Sorry',
                                    '...please accept our terms & conditions',
                                    backgroundColor: pinkClr,
                                    borderRadius: 15,
                                    snackPosition: SnackPosition.TOP);
                              } else if (formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String password = emailController.text.trim();
                                String name = emailController.text.trim();
                                authController.signUpUsingFirebase(
                                    email: email,
                                    password: password,
                                    name: name);
                              }
                            },
                            text: 'Sign Up',
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
                onPressed: () {
                  Get.toNamed(Routes.logInScreen);
                },
                text: 'Already have an account ?',
                text2: 'Log in'),
          ],
        ),
      ),
    ));
  }
}
