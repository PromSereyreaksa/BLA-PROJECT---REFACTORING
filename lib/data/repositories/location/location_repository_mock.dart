import '../../../model/ride/locations.dart';
import '../../dummy_data.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository {
  @override
  List<Location> getLocations() {
    return fakeLocations;
  }
}
