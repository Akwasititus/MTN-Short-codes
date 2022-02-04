import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'constants.dart';

class Admob {
  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2056494218224089/7470242086',
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) => Fluttertoast.showToast(
              msg: kBannerAdLoading,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: kFlutterToastBackgroundColor,
              textColor: kFlutterToastTextColor,
              fontSize: 16.0),
          onAdFailedToLoad: (Ad ad, LoadAdError error) => ad.dispose(),
          onAdOpened: (Ad ad) => Fluttertoast.showToast(
              msg: kBannerAdOpen,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: kFlutterToastBackgroundColor,
              textColor: kFlutterToastTextColor,
              fontSize: 16.0),
          onAdClosed: (Ad ad) => Fluttertoast.showToast(
              msg: kBannerAdClose,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: kFlutterToastBackgroundColor,
              textColor: kFlutterToastTextColor,
              fontSize: 16.0),
        ),
        request: const AdRequest());
    return ad;
  }
}
