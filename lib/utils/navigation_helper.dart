import 'dart:io';

import 'package:flutter/material.dart';
import '../screens/get_started_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/redeem_coupon_screen.dart';

const splashScreen = '/';
const loginScreen = '/screen1';
const homeScreen = '/screen2';
const redeemCouponScreen = '/screen3';

final routes = <String, WidgetBuilder> {
  splashScreen: (BuildContext context) => const GetStartedScreen(),
  loginScreen: (BuildContext context) => const LoginScreen(),
  homeScreen: (BuildContext context) => const HomeScreen(),
  redeemCouponScreen: (BuildContext context) => RedeemCouponScreen(),
};

//launches the new screen when key is provided
void pushScreen(BuildContext context, String key) {
  Navigator.pushNamed(context, key);
}

//launches the new screen by popping the previous
void popAndPushNamed(BuildContext context, String key) {
  Navigator.popAndPushNamed(context, key);
}

//If there is back screen to navigate user can go back, else app will be closed
void popScreen(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  } else {
    exit(0);
  }
}

void popDialog(BuildContext context){
  Navigator.of(context).pop();
}