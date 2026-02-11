import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String title;
  final Color primaryColor ;
  final Color secondaryColor;
  final IconData? icon;
  final VoidCallback onPressed;
  const BlaButton({super.key, required this.title, required this.onPressed, required this.primaryColor, required this.secondaryColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min, // Make button size wrap content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: secondaryColor),
              SizedBox(width: 8), // Space between icon and text
            ],
            Text(title, style: BlaTextStyles.label.copyWith(color: secondaryColor)),
          ],
        ),
      ),
    );
  }
}
