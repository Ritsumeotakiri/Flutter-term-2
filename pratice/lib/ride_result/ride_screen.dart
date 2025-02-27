import 'package:flutter/material.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride_pref/ride_pref.dart';
import 'widgets/ride_card';

class RidesScreen extends StatelessWidget {
  final RidePref selectedPref;
  const RidesScreen({super.key, required this.selectedPref});

  //
  // Checking Method to see if the location is matching within the data
  //
  bool _locationsMatch(Location a, Location b) {
    return a.name == b.name && a.country == b.country;
  }

  @override
  Widget build(BuildContext context) {
    // Filter rides based on selected preference
    final matchingRides = fakeRides.where((ride) {
      return _locationsMatch(ride.departureLocation, selectedPref.departure) &&
          _locationsMatch(ride.arrivalLocation, selectedPref.arrival);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Matching Rides"),
      ),
      // Check if there is matching rides, if not show message
      body: matchingRides.isEmpty
          ? Center(
              child: Text("No rides found for your preferences."),
            )
          : ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (context, index) {
                final ride = matchingRides[index];
                return RideCard(
                  ride: ride,
                );
              },
            ),
    );
  }
}
