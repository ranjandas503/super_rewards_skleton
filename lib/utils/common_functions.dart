import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:superrewards/models/CouponCode.dart';
import 'package:superrewards/models/coupon.dart';
import 'exporter.dart';

extension BuildContextExtension on BuildContext {

  // extension function for showing snackbar
  void showSnackbar(String data, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(data),
        backgroundColor: isError ? colorError : colorPrimary,
      ),
    );
  }

  // extension function for back press
  void onBackPress() {
    popScreen(this);
  }

  // extension function to show dialog with on click function
  showDialogOnClick(String title, String content, {Function? onDialogButtonClick}) {
    showDialog(
        context: this,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    popDialog(context);
                    onDialogButtonClick?.call();
                  },
                  child: const Text(strOk)),
            ],
          );
        });
  }
}

// Loading the home grid data from folder
Future<List<Coupon>> loadGridData() async {
  final jsonString = await rootBundle.loadString(rawGridData);
  var jsonArray = json.decode(jsonString) as List<dynamic>;
  return jsonArray
      .map((json) => Coupon.fromJson(json as Map<String, dynamic>))
      .toList();
}

// Loading the coupon code data from folder
Future<List<CouponCode>> loadCouponData() async {
  final jsonString = await rootBundle.loadString(rawCouponData);
  var jsonArray = json.decode(jsonString) as List<dynamic>;
  return jsonArray
      .map((json) => CouponCode.fromJson(json as Map<String, dynamic>))
      .toList();
}

// Method to check and return empty if any string is empty
String getDefaultStringOrEmpty(String? value) {
  return (value != null) ? value : "";
}

// method to generate random string of provided characters
String generateRandomCoupon({int length = 8}) {
  Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(_rnd.nextInt(characters.length))));
}
