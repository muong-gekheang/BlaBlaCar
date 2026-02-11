import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/screens/ride_pref/widgets/location_card.dart';
import 'package:blabla/screens/widget/location_search.dart';
import 'package:blabla/service/ride_prefs_service.dart';
import 'package:flutter/material.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  String searchQuery = "";

  void onSearched(String value) {
    setState(() {
      searchQuery = value;
    });
  }

  Widget filteredLocation() {
    final ridePrefsHistory = RidePrefService.ridePrefsHistory;
    final departureHistoryLocations = ridePrefsHistory
        .map((ridePref) => ridePref.departure)
        .toList();

    final arrivalHistoryLocations = ridePrefsHistory
        .map((ridePref) => ridePref.arrival)
        .toList();

    final historyLocations = [
      ...departureHistoryLocations,
      ...arrivalHistoryLocations,
    ].toSet().toList();

    List<Location> filteredAvailableLocation;
    List<Location> filteredHistoryLocation;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      filteredHistoryLocation = historyLocations
          .where(
            (location) =>
                location.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                location.country.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();

      filteredAvailableLocation = fakeLocations
          .where(
            (location) =>
                location.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                location.country.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();
    } else {
      filteredHistoryLocation = historyLocations;
      filteredAvailableLocation = [];
    }

    return ListView(
      children: [
        if (filteredHistoryLocation.isNotEmpty)
          ...filteredHistoryLocation.map(
            (historyLocation) => LocationCard(
              icon: Icons.history,
              location: historyLocation,
              onSelected: (selectedLocation) {
                Navigator.pop(context, selectedLocation);
              },
            ),
          ),
        if (filteredAvailableLocation.isNotEmpty)
          ...filteredAvailableLocation
              .where(
                (availableLocation) =>
                    !filteredHistoryLocation.contains(availableLocation),
              )
              .map(
                (availableLocation) => LocationCard(
                  location: availableLocation,
                  onSelected: (selectedLocation) {
                    Navigator.pop(context, selectedLocation);
                  },
                ),
              ),
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LocationSearch(onChanged: onSearched),
          Expanded(child: filteredLocation()),
        ],
      ),
    );
  }
}
