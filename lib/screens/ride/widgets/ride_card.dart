import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  const RideCard({super.key,required this.ride});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Departure: ${ride.departureLocation.name}',
            style: TextStyle(color: BlaColors.neutralLight),
          ),
          Text(
            'Arrival: ${ride.arrivalLocation.name}',
            style: TextStyle(color: BlaColors.neutralLight),
          ),
          Text('Time: ${DateFormat('HH:mm').format(ride.arrivalDateTime)}', style: TextStyle(color: BlaColors.neutralLight)),
          Text(
            'Arrival: ${ride.availableSeats}',
            style: TextStyle(color: BlaColors.neutralLight),
          ),
        ],
      ),
    );
  }
}
