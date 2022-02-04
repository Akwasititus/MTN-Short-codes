import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share/share.dart';
import 'package:wiredash/wiredash.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../utils/constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final InAppReview inAppReview = InAppReview.instance;
  InterstitialAddBank myAdd = InterstitialAddBank();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('images/mtn.jpg')),
            accountEmail: Text('MTN GH'),
            accountName: Text(kAppBarName,
                style: TextStyle(
                    fontSize: 20, fontFamily: 'BungeeInline-Regular')),
            decoration: BoxDecoration(
              color: kDrawerColor,
            ),
          ),
          Card(
            child: ListTile(
              hoverColor: kAppBarColor,
              leading: const Icon(Icons.share),
              title: const Text(
                'Share',
                style: TextStyle(fontSize: 17.0, fontFamily: 'Rancho-Regular'),
              ),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  myAdd.showInterstitialAd();
                  Share.share(
                      'This App has all MTN USSD Codes in it. Try it Now \n https://play.google.com/store/apps/details?id=com.titi.mtnussdcodes',
                      subject: 'Thanks for Sharing');
                });
              },
            ),
          ),
          Card(
            child: ListTile(
              hoverColor: kAppBarColor,
              leading: const Icon(Icons.rate_review),
              title: const Text(
                'Rate Us',
                style: TextStyle(fontSize: 17.0, fontFamily: 'Rancho-Regular'),
              ),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  myAdd.showInterstitialAd();
                  inAppReview.openStoreListing(
                      appStoreId: 'com.titi.mtnussdcodes'); //284708449
                });
              },
            ),
          ),
          Card(
            child: ListTile(
              hoverColor: kAppBarColor,
              leading: const Icon(Icons.account_box_outlined),
              title: const Text(
                'About',
                style: TextStyle(fontSize: 17.0, fontFamily: 'Rancho-Regular'),
              ),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  myAdd.showInterstitialAd();
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.info,
                    text: kAlertDescribtion,
                  );
                });
              },
            ),
          ),
          Card(
            child: ListTile(
              hoverColor: kAppBarColor,
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(
                'Feedback',
                style: TextStyle(fontSize: 17.0, fontFamily: 'Rancho-Regular'),
              ),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  myAdd.showInterstitialAd();
                  Wiredash.of(context)?.show();
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Social Media
          const Center(
            child: Text(
              'MTN Social Media Handles',
              style: TextStyle(fontSize: 15.0, fontFamily: kFontHeader),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            color: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Youtube logo
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('https://www.youtube.com/mtnghana');
                  },
                  child: Ink.image(
                    image: const AssetImage('images/youtube.png'),
                    // fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),

                //twitter logo
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('https://twitter.com/MTNGhana');
                  },
                  child: Ink.image(
                    image: const AssetImage('images/twitter.png'),
                    // fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),

                //instagram logo
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('https://www.instagram.com/MTNGhana/');
                  },
                  child: Ink.image(
                    image: const AssetImage('images/instergram.png'),
                    // fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),

                //Facebook logo
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('https://www.facebook.com/MTNGhana/');
                  },
                  child: Ink.image(
                    image: const AssetImage('images/facebook.png'),
                    // fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),

                //website official
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('https://www.mtn.com.gh/');
                  },
                  child: Ink.image(
                    image: const AssetImage('images/website.png'),
                    // fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
