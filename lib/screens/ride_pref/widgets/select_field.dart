import 'package:flutter/material.dart';

class SelectField extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final IconData leadingIcon;
  final TextEditingController textEditingController;
  const SelectField({
    super.key,
    required this.hintText,
    required this.onTap,
    required this.leadingIcon,
    required this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(leadingIcon, color: Colors.grey),
          hint: Text(hintText, style: TextStyle(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        controller: textEditingController,
        readOnly: true,
        showCursor: false,
        onTap: onTap,
      ),
    );
  }
}
