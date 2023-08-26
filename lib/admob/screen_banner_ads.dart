import 'package:admob/admob/admob_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ScreenBannerAds extends StatefulWidget {
  const ScreenBannerAds({Key? key}) : super(key: key);

  @override
  State<ScreenBannerAds> createState() => _ScreenBannerAdsState();
}

class _ScreenBannerAdsState extends State<ScreenBannerAds> {
  late BannerAd  _bannerAd;
  bool isBannerAdLoaded = false;

  initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdmobManager.banner_id,
      request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            setState(() {
              isBannerAdLoaded = true;
            });
          },
          // Called when an Ad request Failed
          onAdFailedToLoad: (Ad ad, LoadAdError error){
            ad.dispose();
            print('HelloAds Ad Failed to load: $error');
    },
    onAdOpened: (Ad ad) => print('HelloAds Ad Opened.')
        ),
        );
    _bannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

  @override
  void disposeState() {
    // TODO: implement initState
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(title: Text('Banner Ads'),),
        body: Container(child: Text('This is Banner Ads Screen'),),
        bottomNavigationBar: isBannerAdLoaded
            ? Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: _bannerAd.size.width.toDouble(),
          height: _bannerAd.size.height.toDouble(),
          child:AdWidget(ad: _bannerAd,),
        )
            : SizedBox(),
      ),
    );
  }
}
