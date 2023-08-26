import 'package:admob/admob/admob_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ScreenInterTitialImplement extends StatefulWidget {
  const ScreenInterTitialImplement({Key? key}) : super(key: key);
  @override
  State<ScreenInterTitialImplement> createState() => _ScreenInterTitialImplementState();
}

class _ScreenInterTitialImplementState extends State<ScreenInterTitialImplement> {
  late InterstitialAd _intertitialAd;
  bool isInterAdLoaded = false;

  initInterstitialAd(){
    InterstitialAd.load(
        adUnitId: AdmobManager.inter_id,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad){
              _intertitialAd = ad;
              isInterAdLoaded =true;
              _intertitialAd.fullScreenContentCallback = FullScreenContentCallback(
                  onAdDismissedFullScreenContent: (ad){
                    _intertitialAd.dispose();
                  },
                  onAdFailedToShowFullScreenContent: (ad, error){
                    _intertitialAd.dispose();
                  }
              );
            },
            onAdFailedToLoad: (error){
            }
        )
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initInterstitialAd();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(isInterAdLoaded){
          _intertitialAd.show();
        }
        Navigator.pop(context);
        return null! ;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Intertitial Ads'),centerTitle: true,
        leading: InkWell(
          onTap: (){
            if(isInterAdLoaded){
              _intertitialAd.show();
            }
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),),
        body: Text('this is Intertitial Ads'),
      ),
    );
  }
}
