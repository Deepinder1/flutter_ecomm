//qr without using firestore

import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/models/product_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class QRCode extends StatelessWidget {
  final Product productData;

  const QRCode({Key key, @required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: QrImage(
            data: '${productData.productName}',
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
