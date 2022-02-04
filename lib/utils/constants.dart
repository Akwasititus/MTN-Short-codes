import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../Screens/mtn_shot_codes.dart';

InterstitialAd? interstitialAd;

int _interstitialLoadAttempts = 0;

//colors
const kAppBarColor = Color(0xFFFFC000);
const kCardColor = Color(0xFFDE970B);
const kFlutterToastBackgroundColor = Colors.white70;
const kFlutterToastTextColor = Colors.black54;
const kSplashScreenColor = Color(0xFFF9D20D);
const kDrawerColor = Color(0xFFFFCC01);

//fonts
const kFontHeader = 'Dongle-Regular';

//strings
const message = 'Press button again to exist';
const kAppBarName = 'MTN Ghana USSD Dial';
const kBannerAdLoading = 'Loading...';
const kBannerAdOpen = 'Ad Open';
const kBannerAdClose = 'Ad Close';
const kFontSize = 25.0;
const kEnterScratchCardNumber = 'Please Choose option 6 for MTN Nkomode';
const kNkomode = 'Please Enter the Numbers on the Scratch Card here';

const kAlertDescribtion =
    "In this App, we will be updating  you with MTN USSD short codes and the most used ones. \n\n "
    "The main objective for the App is to eliminate stress with regards to"
    " long process of performing out specific activities \n\n "
    "created by thightus\n"
    "Please give me feedback on: \n"
    "iakwasititus@gmail.com";

const kHeaderTextStyle = TextStyle(color: Colors.white, fontSize: 17);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.black87,
  onSurface: const Color(0xFFFFC000),
  minimumSize: const Size(200, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const StadiumBorder(),
  side: const BorderSide(
    width: 1,
    color: Colors.blueAccent,
  ),
);

class InterstitialAddBank {
  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-2056494218224089/6661015225',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!.show();
    }
  }
}
