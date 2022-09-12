import 'package:flutter/material.dart';
//import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:songapp/gameConfig.dart';
import 'package:songapp/playlists.dart';
import 'package:songapp/song.dart';

import 'gameMenu.dart';
import 'home.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() async {
  //debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterBranchSdk.validateSDKIntegration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Playlists(),
    );
  }
}
