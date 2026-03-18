import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';
import '../../states/ride_preference_state.dart';
import '../../../utils/animations_util.dart';
import '../rides_selection/rides_selection_screen.dart';
import './widgets/home_content.dart';
import './view_model/home_model.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  final RidePreferencesState ridePrefState;
  const HomeScreen({super.key, required this.ridePrefState});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    // TODO: Inject RidePrefState via provider/repository injection instead of direct access
    _viewModel = HomeViewModel(ridePrefState: widget.ridePrefState);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _onRidePrefSelected(RidePreference selectedPreference) async {
    // 1 - Ask the view model to update the current preference
    _viewModel.selectPreference(selectedPreference);
    // 2 - Navigate to the rides screen
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
    // 3 - No manual setState needed — ViewModel notifies listeners automatically
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => HomeContent(
        viewModel: _viewModel,
        onRidePrefSelected: _onRidePrefSelected,
      ),
    );
  }
}
