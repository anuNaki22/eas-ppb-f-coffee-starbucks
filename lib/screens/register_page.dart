import 'package:coffee_starbucks/screens/login_page.dart';
import 'package:coffee_starbucks/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/text_field.dart';
import 'address_setup_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isTermsAccepted = false;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showTermsOfUseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms of Use'),
          content: const SingleChildScrollView(
            child: Text('1. Pendahuluan\n'
                'Selamat datang di aplikasi Coffee Starbucks, solusi terbaik Anda untuk memesan kopi Starbucks favorit Anda. Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi dan terikat oleh ketentuan dan syarat berikut.\n\n'
                '2. Registrasi Akun\n'
                'Untuk menggunakan fitur tertentu dari aplikasi ini, Anda mungkin perlu mendaftar untuk sebuah akun. Anda setuju untuk memberikan informasi yang akurat dan lengkap serta menjaga informasi ini tetap up-to-date.\n\n'
                '3. Privasi\n'
                'Kami menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Informasi yang kami kumpulkan akan digunakan sesuai dengan kebijakan privasi kami.\n\n'
                '4. Pemesanan\n'
                'Anda dapat memesan berbagai produk Starbucks melalui aplikasi ini. Pastikan untuk memeriksa detail pesanan Anda sebelum mengonfirmasi. Kami tidak bertanggung jawab atas kesalahan dalam pesanan yang disebabkan oleh kelalaian Anda.\n\n'
                '5. Pembayaran\n'
                'Pembayaran dapat dilakukan melalui metode pembayaran yang tersedia di aplikasi ini. Semua transaksi bersifat final dan tidak dapat dibatalkan setelah dikonfirmasi.\n\n'
                '6. Perubahan dan Pembatalan\n'
                'Kami berhak untuk mengubah atau membatalkan pesanan Anda jika terjadi kesalahan atau masalah yang tidak terduga. Kami akan memberi tahu Anda sesegera mungkin jika pesanan Anda terpengaruh.\n\n'
                '7. Batasan Tanggung Jawab\n'
                'Kami tidak bertanggung jawab atas kerugian atau kerusakan yang timbul dari penggunaan aplikasi ini. Penggunaan aplikasi ini sepenuhnya merupakan risiko Anda sendiri.\n\n'
                '8. Perubahan Ketentuan\n'
                'Kami dapat mengubah ketentuan penggunaan ini sewaktu-waktu. Perubahan akan diberitahukan melalui aplikasi ini. Dengan terus menggunakan aplikasi ini setelah perubahan, Anda setuju untuk terikat oleh ketentuan yang telah diubah.\n\n'
                '9. Kontak\n'
                'Jika Anda memiliki pertanyaan atau masalah mengenai ketentuan penggunaan ini, silakan hubungi layanan pelanggan kami melalui aplikasi ini.\n\n'
                'Terima kasih telah menggunakan aplikasi Coffee Starbucks!'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Accept',
                style: TextStyle(
                  color: Color(0xFF1AA570), // Warna hijau
                  fontSize: 14.0, // Ukuran sedikit lebih kecil
                ),
              ),
              onPressed: () {
                setState(() {
                  _isTermsAccepted = true;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Color(0xFF1AA570), // Warna hijau
                  fontSize: 14.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool get _isFormValid =>
      fullNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneNumberController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      _isTermsAccepted;

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
                  'Register'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Full Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'Nama Lengkap',
                isPasswordField: false,
                controller: fullNameController,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: 'alamat@mail.com',
                isPasswordField: false,
                controller: emailController,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CustomTextFieldWidget(
                hintText: '+62 8123 4567 890',
                isPasswordField: false,
                controller: phoneNumberController,
              ),
              SizedBox(
                height: 18.h,
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
                height: 18.h,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        _isTermsAccepted = value ?? false;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: _showTermsOfUseDialog,
                    child: Text(
                      'I accept the Terms of Use',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              ButtonWidget(
                text: 'Register',
                onTap: () {
                  if (_isFormValid) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddressSetupPage(),
                      ),
                    );
                  }
                },
                isEnabled: _isFormValid,
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
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: 'Login ',
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
            ],
          ),
        ),
      ),
    );
  }
}
