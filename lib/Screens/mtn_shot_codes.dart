import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled/Screens/drawer.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/utils/widgets.dart';

import '../utils/admob.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:fluttertoast/fluttertoast.dart';

const int maxFailedLoadAttempts = 3;

class MTNShotCodesCenter extends StatefulWidget {
  const MTNShotCodesCenter({Key? key}) : super(key: key);

  @override
  State<MTNShotCodesCenter> createState() => _MTNShotCodesCenterState();
}

class _MTNShotCodesCenterState extends State<MTNShotCodesCenter> {
  DateTime timeBackPressed = DateTime.now();
  Admob admob = Admob();
  InterstitialAddBank myAdd = InterstitialAddBank();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myAdd.createInterstitialAd();
    myAdd.showInterstitialAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 3);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          Fluttertoast.showToast(
              msg: message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: kFlutterToastBackgroundColor,
              textColor: kFlutterToastTextColor,
              fontSize: 16.0);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 52,
          child: AdWidget(
            key: UniqueKey(),
            ad: Admob.createBannerAd()..load(),
          ),
        ),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(kAppBarName,
              style: TextStyle(color: Colors.black, fontSize: 17)),
          centerTitle: true,
          backgroundColor: kAppBarColor,
        ),
        body: Accordion(
          contentBackgroundColor: Colors.blue[50],
          maxOpenSections: 1,
          children: [
            AccordionSection(
                isOpen: false,
                headerBackgroundColor: kCardColor,
                header: const Center(
                  child: Text('Balance enquiry',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion: '*124#',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('tel://*124%23');
                  },
                )),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN MashUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*567*1%23');
                },
                contentDescribtion: '*567*1#',
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Call Center',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '100',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://100');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN Self Service',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*1333#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*1333%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN Family and Friends Service',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*811#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*811%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN GH Roaming Service',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*5090#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*5090%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN SME Offers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*5060#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*5060%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Activate Call Waiting',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*43#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*43%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Outgoing Caller ID',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*31#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*31%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('sharing Data Bundle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*513#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*513%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN MoMo Business Account Registration',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*5051#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*5051%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Government Payment/GRA',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*222#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*222%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Buy Prepaid ECG',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*226#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*226%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('ExpressPay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*246#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*246%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Care 247 Service',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*247#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*247%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Republic Bank Mobile Banking',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*414#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*414%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('GCBMobile / G-Money',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*422#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*422%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Stanbic Bank',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*715#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*715%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Ecobank Mobile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*725#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*725%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('COVID-19',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*769#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*769%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('NHIS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '*929#',
                onPress: () {
                  myAdd.showInterstitialAd();
                  UrlLauncher.launch('tel://*929%23');
                },
              ),
            ),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Activate and Deactivate PhoneBook Backup',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                contentDescribtion: '7014',
                onPress: () {
                  myAdd.showInterstitialAd();
                  Fluttertoast.showToast(
                      msg:
                          'Send Start to Activate PhoneBook Backup or Stop to Deactivate',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: kFlutterToastBackgroundColor,
                      textColor: kFlutterToastTextColor,
                      fontSize: 16.0);
                  UrlLauncher.launch('sms:7014?Your message here');
                },
              ),
            ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Reloading Airtime',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion: '*134*PIN#',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    Fluttertoast.showToast(
                        msg: kEnterScratchCardNumber,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kFlutterToastBackgroundColor,
                        textColor: kFlutterToastTextColor,
                        fontSize: 16.0);
                    UrlLauncher.launch('tel://*134*000%23');
                  },
                )),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Pay For Me',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion:
                      'Dial 154 followed by number without space. '
                      'This will make the recepient of the call pay for the call.',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('tel://154[0244000000]');
                  },
                )),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('To Borrow Some Credit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion: '*506#',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch("tel://*506%23");
                  },
                )),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Caller tunez',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion: '1355',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('tel://1355');
                  },
                )),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('MTN mobile money',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                  contentDescribtion: '*170#',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('tel://*170%23');
                  }),
            ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Voicemail sending',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '108',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://108');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Voicemail receiving',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '109',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://109');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Generate Mobile Money ATM token',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                  contentDescribtion: '*511#',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('tel://*511%23');
                  },
                )),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Check your MTN mobile number',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*156#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*156%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('To recharge airtime for someone',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion:
                        '*144*number to recharge for*voucher number#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*144*000*000%23');
                    })),
            AccordionSection(
              headerBackgroundColor: kCardColor,
              isOpen: false,
              header: const Center(
                child: Text('Report Mobile Money fraud',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: kFontSize,
                        fontFamily: kFontHeader)),
              ),
              content: ContentWidget(
                  contentDescribtion:
                      'Send a text message to 1515 from your phone with the name of the merchant and date of incident.\n 1515',
                  onPress: () {
                    myAdd.showInterstitialAd();
                    UrlLauncher.launch('sms:1515?Your message here');
                  }),
            ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Whatsapp line',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '0554300000 \n '
                        'Click to chat with MTN on WhatsAPP',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('https://wa.link/eu0ceb');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text(
                      'Manage your subscriptions. Add or cancel subscriptions.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*175#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*175%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Reserve your number for 2 years',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*1390#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*1390%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Radio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '1303',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://1303');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Share credit with friends and family',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*198#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*198%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Farm Direct. Access the best farming tips.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '30037',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://30037');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('aYo recharge with care',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*296#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*296%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('WeChat monthly data bundle',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*1552#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*1552%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('To know if your number is registered',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*400#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*400%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Get cool jokes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*300*20#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*300*20%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text(
                      'To exempt (or include) yourself from mobile money interest payments to your account.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*595#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*595%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('02xxxxxxxx Simbox to 419',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: 'Report SIM-Box fraud',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://02000 419');
                      UrlLauncher.launch('sms:419?Your message here');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Request internet settings.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion:
                        'Send a text message to 1515 from your phone with the name of the merchant and date of incident. \n 585',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://585');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Blackberry Plans',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*140#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*140%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Accurate weather forecast (8p/sms)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*455#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*455%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN offers',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*550#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*550%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Free After 1 (MTN Nkomode)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*550# \n Option 6',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      Fluttertoast.showToast(
                          msg: kNkomode,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kFlutterToastBackgroundColor,
                          textColor: kFlutterToastTextColor,
                          fontSize: 16.0);
                      UrlLauncher.launch('tel://*550%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Just4U offer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*141#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*141%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Bundle Portal',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*138#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*138%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('To borrow Some Credit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*506#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*506#');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('To recharge airtime for someone.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*144*000*000#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://*144*000r*000%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Divert all Calls',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '**21*020000*11#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://**21*0200000*11%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Deactivate Call Divert',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '##21#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://##21%23');
                    })
                //Text('Deactivate Call Divert'),
                ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Call Divert when busy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '**67*020000*11#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://**67*0200000*11%23');
                    })
                //Text('Call Divert when busy'),
                ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Call Divert when no answer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '**61*0200000*11#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://**61*0200000*11%23');
                    })),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('Call Divert when Unreachable',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '**62*0200000*11#',
                    onPress: () {
                      myAdd.showInterstitialAd();
                      UrlLauncher.launch('tel://**62*0200000*11%23');
                    })
                //Text('Call Divert when Unreachable'),
                ),
            AccordionSection(
                headerBackgroundColor: kCardColor,
                isOpen: false,
                header: const Center(
                  child: Text('MTN Zone Bundle',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize,
                          fontFamily: kFontHeader)),
                ),
                content: ContentWidget(
                    contentDescribtion: '*135*55*1#',
                    onPress: () {
                      myAdd.showInterstitialAd;
                      UrlLauncher.launch('tel://*135*55*1%23');
                    }))
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
//60
