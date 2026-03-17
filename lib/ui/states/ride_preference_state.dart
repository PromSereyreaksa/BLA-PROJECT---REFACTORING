import 'package:flutter/material.dart';
import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _ridePreferenceRepository;
  RidePreference? _selectedPreference;
  final int maxAllowedSeats = 8;

  RidePreferencesState({required RidePreferenceRepository repository})
    : _ridePreferenceRepository = repository;

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceRepository.getRidePreferences();

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;

      _addPreferenceToHistory(preference);
      notifyListeners();
    }
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _ridePreferenceRepository.saveRidePreference(preference);
  }
}
