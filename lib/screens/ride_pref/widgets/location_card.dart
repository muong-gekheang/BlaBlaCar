import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final IconData? icon;
  final Location location;
  final ValueChanged<Location> onSelected;

  const LocationCard({
    super.key,
    this.icon,
    required this.location,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(location),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null) Icon(icon, color: BlaColors.greyLight),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(location.name, style: TextStyle(fontSize: 16)),
                      Text(
                        location.country.name,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),  
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
