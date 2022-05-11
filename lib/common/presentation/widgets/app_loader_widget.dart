import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
    this.color = Colors.blue,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 22,
        width: 22,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(radius: 14, color: color)
            : const CircularProgressIndicator());
  }
}
