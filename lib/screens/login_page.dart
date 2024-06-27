import 'package:coffee_starbucks/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/text_field.dart';
import 'forgot_password_page.dart';
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkIfButtonShouldBeEnabled);
    passwordController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    if (emailController.text == "rahmat@gmail.com" &&
        passwordController.text == "Password123!") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'assets/icons/logo.svg'
                        : 'assets/icons/logo_dark.svg',
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'alamat@gmail.com',
                isPasswordField: false,
                controller: emailController,
              ),
              SizedBox(
                height: 28.h,
              ),
              Text(
                'Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: '********',
                isPasswordField: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password ?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ButtonWidget(
                text: 'login',
                onTap: isButtonEnabled ? _login : null,
                isEnabled: isButtonEnabled,
              ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextSpan(
                          text: 'Register ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 135.w,
                    color: Theme.of(context).dividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'or'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 135.w,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialButton(context, 'assets/icons/google_logo.svg'),
                  socialButton(context, 'assets/icons/facebook_logo.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(BuildContext context, String asset) {
    return Container(
      padding: const EdgeInsets.all(22),
      height: 70.h,
      width: 70.h,
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SvgPicture.asset(asset),
    );
  }
}
