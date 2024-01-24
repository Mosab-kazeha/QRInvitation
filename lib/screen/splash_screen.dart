import 'package:flutter/material.dart';
import 'package:qr_invitation_app/const/const-file.dart';
import 'package:qr_invitation_app/screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * (1 / 4)),
          Image.asset(qrImage),
          SizedBox(height: MediaQuery.of(context).size.height * (1 / 4)),
          const Text(
            'Go and enjoy our features for free and make your life easy with us.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * (1 / 32)),
          MainContainer(
            context: context,
            containerText: 'Let’s Start',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
