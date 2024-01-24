import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_invitation_app/const/const-file.dart';

class ShowQRScreen extends StatelessWidget {
  ShowQRScreen({Key? key, required this.customerName}) : super(key: key);

  String customerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration,
        child: Center(
          child: QrImageView(
            data: customerName,
            version: QrVersions.auto,
            //  eyeStyle: QrEyeStyle(color: mainColor, eyeShape: QrEyeShape.square),
            /*   dataModuleStyle: QrDataModuleStyle(color: mainColor, dataModuleShape: QrDataModuleShape.square),*/
            size: MediaQuery.of(context).size.width / 1.5,
          ),
        ),
      ),
    );
  }
}
