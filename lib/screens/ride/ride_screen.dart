import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/screens/ride/widgets/ride_card.dart';
import 'package:blabla/screens/widget/location_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  void onSearched(String value){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LocationSearch(onChanged: onSearched),
          RideCard(ride: fakeRides[0],),
        ],
      ),
    );
    ;
  }
}