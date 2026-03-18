import 'package:flutter/material.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePrefState;

  HomeViewModel({required RidePreferencesState ridePrefState})
    : _ridePrefState = ridePrefState {
    _ridePrefState.addListener(notifyListeners);
  }

  RidePreference? get currentPreference => _ridePrefState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePrefState.preferenceHistory.reversed.toList();

  void selectPreference(RidePreference preference) {
    _ridePrefState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePrefState.removeListener(notifyListeners);
    super.dispose();
  }
}
