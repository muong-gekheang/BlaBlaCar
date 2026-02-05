import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(Location departure) {
    final filteredResult = fakeRides
        .where((r) => r.departureLocation == departure)
        .toList();
    return filteredResult;
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(int requestedSeat) {
    final filteredResult = fakeRides
        .where((r) => r.availableSeats == requestedSeat)
        .toList();
    return filteredResult;
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    if (departure != null && seatRequested != null) {
      return fakeRides
          .where(
            (r) =>
                r.departureLocation == departure &&
                r.availableSeats == seatRequested,
          )
          .toList();
    } else if (departure != null) {
      return _filterByDeparture(departure);
    } else if (seatRequested != null) {
      return _filterBySeatRequested(seatRequested);
    } else {
      return availableRides;
    }
  }

  
}
