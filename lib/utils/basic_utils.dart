import 'package:flutter/material.dart';

class BasicUtils {


  static openBottomSheet(BuildContext context,Widget child) {
    return showModalBottomSheet(context: context, 
    builder: (context) {
      return child;
    });
  }
}