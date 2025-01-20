import 'dart:async';

import 'package:flutter/material.dart';

import '../Common widgets/On_boarding_model.dart';

class OnBoardingProvider extends ChangeNotifier {
  List<OnBoardingModel> collection = [
    OnBoardingModel(
        image:
            "https://www.pngplay.com/wp-content/uploads/6/E-Commerce-Shopping-PNG-Clipart-Background.png",
        title: "View product 360 degree",
        subtitle:
            "you can see the product in all angle, with true and convenient"),
    OnBoardingModel(
        image:
            "https://cdni.iconscout.com/illustration/premium/thumb/women-doing-online-shopping-2890192-2406814.png",
        title: "View product easily",
        subtitle:
            "you can take a photo and upload,we will find similar product for you"),
    OnBoardingModel(
        image:
            "https://cdni.iconscout.com/illustration/premium/thumb/online-payment-with-mobile-2645883-2218295.png",
        title: "Payment is easy",
        subtitle: "you can easily do online payment to purchase product")
  ];
  Timer? timer;
  int index = 0;


  void changeindex(int value) {
    index = value; //index marandath
    notifyListeners();
  }

  void timerchange(PageController controller) {
    timer = Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        if (index == 2) {
          controller.jumpToPage(index);
          index = -1;
        }

        index++;
        controller.jumpToPage(index);
      },
    ); //
  }
  void stoptimer()
  {
    timer?.cancel();
  }
}
