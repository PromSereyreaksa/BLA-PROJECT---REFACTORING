import '../../../model/ride_pref/ride_pref.dart';
import './ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../dummy_data.dart';

class RideRepositoryMock implements RideRepository {
  List<Ride> fetchRide() {
    return fakeRides;
  }

  @override
  List<Ride> getRidesMatchingPreferences(RidePreference preferences) {
    return fetchRide()
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}
