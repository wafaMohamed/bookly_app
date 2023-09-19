import 'package:bookly_app/core/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.color,
      required this.backGround,
      this.borderRadius,
      required this.text,
      required this.fontSize,
      this.onPresses})
      : super(key: key);
  final String text;
  final Color color;
  final Color backGround;
  final double fontSize;
  final void Function()? onPresses;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPresses,
        style: TextButton.styleFrom(
          backgroundColor: backGround,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              color: color, fontWeight: FontWeight.w900, fontSize: fontSize),
        ),
      ),
    );
  }
}
