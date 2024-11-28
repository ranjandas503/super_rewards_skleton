import 'package:flutter/material.dart';

// string constants
const String strAppName = 'Rewards App';
const String strWelcome = 'Welcome to Rewards App';
const String strGetStarted = 'Get Started';
const String strLoginTitle = 'Login';
const String strHome = 'Home';
const String strEmail = 'Email';
const String strPassword = 'Password';
const String strEnterEmail = 'Please enter an email address.';
const String strEnterPassword = 'Please enter a password.';
const String strEnterImage = 'Please select an image.';
const String strEnterProperEmail = 'Please enter a valid email address.';
const String strEnterProperPassword = 'Please enter six digit password.';
const String strOk = 'OK';
const String strCouponCode = 'Coupon Code';
const String strRedeemCode = 'Redeem Code';
const String strApply = 'Apply';
const String strCongratulations = 'Congratulations';
const String strCouponReedemed = 'Coupon redeemed successfully!';
const String strEnterCouponCode = 'Enter Coupon Code';
const String strSubmit = 'Submit';

// resources constants
const imgSplashLogo = 'assets/images/rewards.jpg';
const rawCouponData = 'assets/data/dummyCoupons.json';
const rawGridData = 'assets/data/dummyGrid.json';

// size constants
const padding_2 = 2.0;
const padding_4 = 4.0;
const padding_8 = 8.0;
const padding_12 = 12.0;
const padding_16 = 16.0;
const padding_32 = 32.0;

// other constants
const textSizeTitle = 20.0;
const textSizeDiscount = 12.0;
const imageWidthHeight = 100.0;
const gridCellCount = 4;

// color constants
const MaterialColor colorPrimary = Colors.blue;
const Color colorSecondary = Colors.white;
const Color colorGrey = Colors.grey;
final Color colorSplashBackground = Colors.blue[100]!;
final Color colorGridTile = Colors.blue[200]!;
final Color colorError = Colors.red;

// icon constants
final icons = <dynamic, IconData>{
  null: Icons.dataset_outlined,
  '': Icons.dataset_outlined,
  'null': Icons.dataset_outlined,
  'Icons.pets': Icons.pets,
  'Icons.beach_access': Icons.beach_access,
  'Icons.local_cafe': Icons.local_cafe,
  'Icons.headset': Icons.headset,
  'Icons.home': Icons.home,
  'Icons.directions_bike': Icons.directions_bike,
  'Icons.book': Icons.book,
  'Icons.shopping_cart': Icons.shopping_cart,
  'Icons.fastfood': Icons.fastfood,
  'Icons.local_bar': Icons.local_bar,
  'Icons.girl': Icons.girl,
  'Icons.local_offer': Icons.local_offer,
  'Icons.local_movies': Icons.local_movies,
  'Icons.directions_run': Icons.directions_run,
  'Icons.camera_alt': Icons.camera_alt,
  'Icons.music_note': Icons.music_note,
  'Icons.flight': Icons.flight,
  'Icons.restaurant': Icons.restaurant,
  'Icons.shopping_bag': Icons.shopping_bag,
};
