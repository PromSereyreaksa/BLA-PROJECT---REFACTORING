import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../theme/theme.dart';
import '../view_model/rides_selection_model.dart';
import './rides_selection_header.dart';
import './rides_selection_tile.dart';

class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionViewModel viewModel;
  final VoidCallback onBackPressed;
  final VoidCallback onFilterPressed;
  final void Function(Ride) onRideSelected;
  final Future<void> Function() onPreferencePressed;

  const RidesSelectionContent({
    super.key,
    required this.viewModel,
    required this.onBackPressed,
    required this.onFilterPressed,
    required this.onRideSelected,
    required this.onPreferencePressed,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.currentPreference == null) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.currentPreference!,
              onBackPressed: onBackPressed,
              onFilterPressed: onFilterPressed,
              onPreferencePressed: onPreferencePressed,
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () =>
                      onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
