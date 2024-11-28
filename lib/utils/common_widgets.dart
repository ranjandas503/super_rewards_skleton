import 'package:flutter/material.dart';
import 'resources.dart';

// common elevated style
final commonButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(padding_4), // <-- Radius
  ),
);

// widget for creating common elevated button
Widget createDefaultElevatedButton(BuildContext context, String title, Function? performAction) {
  return ElevatedButton(
    onPressed: () {
      performAction?.call();
    },
    style: commonButtonStyle,
    child: Text(title),
  );
}

// default function for cleating app bar
AppBar createAppBar(String title, bool isBackButtonRequired, {Function? onBackPress}) {
  return AppBar(
    leading: isBackButtonRequired
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onBackPress?.call();
            },
          )
        : null,
    title: Text(title),
  );
}

// default outline for text input field
OutlineInputBorder outlineInputBorder(Color outlineColor) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: outlineColor, width: 2.0),
    borderRadius: BorderRadius.circular(padding_12),
  );
}

// default padding
Padding createDefaultPadding({required Widget child}) {
  return Padding(padding: const EdgeInsets.all(padding_12), child: child);
}