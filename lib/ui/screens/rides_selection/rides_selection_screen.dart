import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/ride/ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../states/ride_preference_state.dart';
import '../../../utils/animations_util.dart';
import './widgets/rides_selection_content.dart';
import './view_model/rides_selection_model.dart';
import 'widgets/ride_preference_modal.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // TODO
  }

  Future<void> onPreferencePressed(
    BuildContext context,
    RidesSelectionViewModel viewModel,
  ) async {
    final currentPreference = viewModel.currentPreference;
    if (currentPreference == null) return;

    final RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: currentPreference),
          ),
        );

    if (newPreference != null) {
      viewModel.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RidesSelectionViewModel>(
      create: (ctx) => RidesSelectionViewModel(
        ridePrefState: ctx.read<RidePreferencesState>(),
        rideRepository: ctx.read<RideRepository>(),
      ),
      child: Consumer<RidesSelectionViewModel>(
        builder: (ctx, viewModel, child) => RidesSelectionContent(
          viewModel: viewModel,
          onBackPressed: () => onBackTap(ctx),
          onFilterPressed: onFilterPressed,
          onRideSelected: onRideSelected,
          onPreferencePressed: () => onPreferencePressed(ctx, viewModel),
        ),
      ),
    );
  }
}
