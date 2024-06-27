import 'package:coffee_starbucks/screens/login_page.dart';
import 'package:coffee_starbucks/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/text_field.dart';

class AddressSetupPage extends StatefulWidget {
  const AddressSetupPage({super.key});

  @override
  State<AddressSetupPage> createState() => _AddressSetupPageState();
}

class _AddressSetupPageState extends State<AddressSetupPage> {
  final TextEditingController addressController1 = TextEditingController();
  final TextEditingController addressController2 = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    addressController1.addListener(_checkIfButtonShouldBeEnabled);
    addressController2.addListener(_checkIfButtonShouldBeEnabled);
    zipCodeController.addListener(_checkIfButtonShouldBeEnabled);
    cityController.addListener(_checkIfButtonShouldBeEnabled);
    countryController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void dispose() {
    addressController1.dispose();
    addressController2.dispose();
    zipCodeController.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      isButtonEnabled = addressController1.text.isNotEmpty &&
          addressController2.text.isNotEmpty &&
          zipCodeController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          countryController.text.isNotEmpty;
    });
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
                  'Address Setup'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Alamat Lengkap 1',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'Address',
                isPasswordField: false,
                controller: addressController1,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Alamat Lengkap 2',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'Address',
                isPasswordField: false,
                controller: addressController2,
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zip Code',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: CustomTextFieldWidget(
                          hintText: '61234',
                          isPasswordField: false,
                          controller: zipCodeController,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: CustomTextFieldWidget(
                          hintText: 'Surabaya',
                          isPasswordField: false,
                          controller: cityController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Country',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'Indonesia',
                isPasswordField: false,
                controller: countryController,
              ),
              SizedBox(
                height: 35.h,
              ),
              ButtonWidget(
                text: 'Add Address',
                onTap: isButtonEnabled
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    : null,
                isEnabled: isButtonEnabled,
              ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Skip for now',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
