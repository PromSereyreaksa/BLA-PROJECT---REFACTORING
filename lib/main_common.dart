import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/screens/home/home_screen.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(
            builder: (context) =>
                HomeScreen(ridePrefState: context.read<RidePreferencesState>()),
          ),
        ),
      ),
    ),
  );
}
