import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final Function()? onTap;
  final IconData? icon;
  final IconData? icon2;
  TextStyle? style;

  MyButton({
    super.key,
    required this.text,
    this.gradient,
    required this.onTap,
    this.icon,
    this.icon2,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],

            Text(
              text,
              style:
                  style ??
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),

            if (icon2 != null) ...[const SizedBox(width: 8), Icon(icon2)],
          ],
        ),
      ),
    );
  }
}
