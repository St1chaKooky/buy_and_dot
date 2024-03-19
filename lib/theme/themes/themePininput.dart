import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final pinTheme = PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
    textStyle: TextStyle(),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorCollection.outline)));
