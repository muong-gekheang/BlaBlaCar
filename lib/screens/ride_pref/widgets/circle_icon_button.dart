import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: BlaColors.white,
          border: Border.all(
            width: 4, 
            color: color == null ? BlaColors.greyLight : color!),
        ),
        child: Icon(icon, color: color == null ? BlaColors.greyLight : color!, size: 32,),
      ),
    );
  }
}
