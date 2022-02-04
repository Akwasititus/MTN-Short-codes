import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled/Screens/splash_screen.dart';
import 'package:wiredash/wiredash.dart';

import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorKey,
      secret: '0SIJecwNhPhk7tEHs4vesz9O5m2dlMBH',
      projectId: 'mtn-shorts-codes-mi9lr5y',
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: kAppBarName,
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
