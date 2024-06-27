import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    required this.isPasswordField,
    required this.controller,
  });

  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool hidePassword = true; // Default to hiding the password

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        obscureText: widget.isPasswordField && hidePassword,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Theme.of(context).primaryColorLight,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
