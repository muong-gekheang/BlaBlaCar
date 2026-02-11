import 'package:flutter/material.dart';

class LocationSearch extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const LocationSearch({super.key, required this.onChanged});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final TextEditingController _searchController = TextEditingController();

  void onchanged(String value) {
    setState(() {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _searchController,
        onChanged: onchanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 18),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _searchController.clear;
            },
            icon: Icon(Icons.close),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
