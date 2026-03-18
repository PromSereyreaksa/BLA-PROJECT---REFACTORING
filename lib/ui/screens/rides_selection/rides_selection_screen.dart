import 'package:flutter/material.dart';
import '../../../data/repositories/ride/ride_repository.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../states/ride_preference_state.dart';
import '../../../utils/animations_util.dart';
import './widgets/rides_selection_content.dart';
import './view_model/rides_selection_model.dart';
import 'widgets/ride_preference_modal.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  final RidePreferencesState ridePrefState;
  final RideRepository rideRepository;

  const RidesSelectionScreen({
    super.key,
    required this.ridePrefState,
    required this.rideRepository,
  });

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late final RidesSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RidesSelectionViewModel(
      ridePrefState: widget.ridePrefState,
      rideRepository: widget.rideRepository,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(ride) {
    // Later
  }

  Future<void> onPreferencePressed() async {
    // 1 - Navigate to the ride preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: _viewModel.currentPreference!,
            ),
          ),
        );
    if (newPreference != null) {
      // 2 - Ask the view model to update the current preference
      _viewModel.selectPreference(newPreference);
      // 3 - No manual setState needed — ViewModel notifies listeners automatically
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => RidesSelectionContent(
        viewModel: _viewModel,
        onBackPressed: onBackTap,
        onFilterPressed: onFilterPressed,
        onRideSelected: onRideSelected,
        onPreferencePressed: onPreferencePressed,
      ),
    );
  }
}
