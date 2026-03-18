import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../states/ride_preference_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePrefState;
  final RideRepository _rideRepository;

  RidesSelectionViewModel({
    required RidePreferencesState ridePrefState,
    required RideRepository rideRepository,
  }) : _ridePrefState = ridePrefState,
       _rideRepository = rideRepository {
    _ridePrefState.addListener(_onStateChanged);
  }

  RidePreference? get currentPreference => _ridePrefState.selectedPreference;

  List<Ride> get matchingRides {
    final pref = currentPreference;
    if (pref == null) return [];
    return _rideRepository.getRidesMatchingPreferences(pref);
  }

  void selectPreference(RidePreference preference) {
    _ridePrefState.selectPreference(preference);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePrefState.removeListener(_onStateChanged);
    super.dispose();
  }
}
