import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view_model/home_model.dart';
import '../../../utils/animations_util.dart';
import '../rides_selection/rides_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRidePrefSelected(
    BuildContext context,
    HomeViewModel homeViewModel,
    RidePreference selectedPreference,
  ) async {
    homeViewModel.selectPreference(selectedPreference);

    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (ctx) =>
          HomeViewModel(ridePrefState: ctx.read<RidePreferencesState>()),
      child: Consumer<HomeViewModel>(
        builder: (ctx, homeViewModel, child) => HomeContent(
          viewModel: homeViewModel,
          onRidePrefSelected: (selectedPreference) =>
              _onRidePrefSelected(ctx, homeViewModel, selectedPreference),
        ),
      ),
    );
  }
}
