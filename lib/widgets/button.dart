import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.isEnabled,
  });

  final String text;
  final VoidCallback? onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          color: isEnabled ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
