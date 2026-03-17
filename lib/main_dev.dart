import 'package:provider/provider.dart';
import './main_common.dart';
import './data/repositories/location/location_repository.dart';
import './data/repositories/location/location_repository_mock.dart';
import './data/repositories/ride/ride_repository.dart';
import './data/repositories/ride/ride_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './ui/states/ride_preference_state.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferencesState>(
      create: (_) =>
          RidePreferencesState(repository: RidePreferenceRepositoryMock()),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
