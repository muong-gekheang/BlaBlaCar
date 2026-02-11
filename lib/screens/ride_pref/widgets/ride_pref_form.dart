import 'package:blabla/screens/ride/ride_screen.dart';
import 'package:blabla/screens/ride_pref/calendar_screen.dart';
import 'package:blabla/screens/ride_pref/location_search_screen.dart';
import 'package:blabla/screens/ride_pref/seat_selection_screen.dart';
import 'package:blabla/screens/widget/bla_button.dart';
import 'package:blabla/screens/ride_pref/widgets/select_field.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    departureDate = DateTime(now.year, now.month, now.day);
    requestedSeats = 1;

    if (departureDate == DateTime(now.year, now.month, now.day)) {
      _dateController.text = "Today";
    } else {
      _dateController.text =
          "${departureDate.month}/${departureDate.day}/${departureDate.year}";
    }
    _seatsController.text = "$requestedSeats";
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  void onDepartSelected() async {
    final selectedDeparture = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationSearchScreen()),
    );

    if (selectedDeparture != null) {
      setState(() {
        departure = selectedDeparture;
        _departureController.text =
            '${departure!.name}, ${departure!.country.name}';
      });
    }
  }

  void onArrivalSelected() async {
    final selectedArrival = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationSearchScreen()),
    );

    if (selectedArrival != null) {
      arrival = selectedArrival;
      _arrivalController.text = '${arrival!.name}, ${arrival!.country.name}';
    }
  }

  void onCalendarSelected() async {
    final selectedDate = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalendarScreen()),
    );

    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
        _dateController.text = DateFormat('E dd MMM').format(selectedDate);
        print(selectedDate);
      });
    }
  }

  void onSeatSelected() async {
    final selectedSeats = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (context) => SeatSelectionScreen()),
    );
    if (selectedSeats != null) {
      setState(() {
        _seatsController.text = "$selectedSeats";
      });
    }
  }

  void onSearched() {
    if (departure != null && arrival != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RideScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationSearchScreen()),
      );
    }
  }

  void onSwitch() {
    final temp = _departureController.text;
    _departureController.text = _arrivalController.text;
    _arrivalController.text = temp;

    final tempLocation = departure;
    departure = arrival;
    arrival = tempLocation;
    setState(() {});

    print("Location after swtiching");
    print("Departure: ${departure!.name}");
    print("Arrival: ${arrival!.name}");
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            SelectField(
              hintText: "Leaving from",
              onTap: onDepartSelected,
              leadingIcon: Icons.circle_outlined,
              textEditingController: _departureController,
            ),
            Positioned(
              right: 10,
              top: 15,
              child: IconButton(
                icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                onPressed: onSwitch
              ),
            ),
          ],
        ),
        SelectField(
          hintText: "Going to",
          onTap: onArrivalSelected,
          leadingIcon: Icons.circle_outlined,
          textEditingController: _arrivalController,
        ),
        SelectField(
          hintText: "",
          onTap: onCalendarSelected,
          leadingIcon: Icons.calendar_month,
          textEditingController: _dateController,
        ),
        SelectField(
          hintText: "",
          onTap: onSeatSelected,
          leadingIcon: Icons.person_2_outlined,
          textEditingController: _seatsController,
        ),
        BlaButton(
          title: 'search',
          onPressed: onSearched,
          primaryColor: BlaColors.primary,
          secondaryColor: BlaColors.white,
        ),
      ],
    );
  }
}
