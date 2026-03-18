import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/screens/home/home_screen.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HomeScreen()),
      ),
    ),
  );
}
