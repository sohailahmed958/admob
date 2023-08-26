import 'package:admob/admob/screen_banner_ads.dart';
import 'package:admob/admob/screenintertitialimplement.dart';
import 'package:flutter/material.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Admob'),centerTitle: true,),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=> ScreenBannerAds()));
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Banner Ads',
                style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.w800),),
            )),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=> ScreenInterTitialImplement()));
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Intertitial Ads',
                style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.w800),),
            )),
          ],
        ),
      ),
    );
  }
}
