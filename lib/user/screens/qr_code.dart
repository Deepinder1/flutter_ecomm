//qr without using firestore

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class QRCode extends StatelessWidget {
  const QRCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: QrImage(
            data: "1234567890",
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
