import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/map/map_screen.dart';
import 'ui/theme/theme.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: const VeloApp(),
    ),
  );
}

class VeloApp extends StatelessWidget {
  const VeloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velo Toulouse',
      theme: appTheme,
      home: const MapScreen(),
    );
  }
}