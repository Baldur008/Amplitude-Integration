import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:flutter/material.dart';

class HomeLogic with ChangeNotifier {
  final BuildContext context;
  HomeLogic(this.context);
  clickedAd(int adNumber, String adType) async {
    await AmplitudeCalls.call("Ad Clicked", {"Type": adType}, context);        
  }
}
