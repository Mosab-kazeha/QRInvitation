import 'package:flutter/material.dart';
import 'package:qr_invitation_app/const/const-file.dart';
import 'package:qr_invitation_app/model/customer_model.dart';
import 'package:qr_invitation_app/screen/generate_screen.dart';
import 'package:qr_invitation_app/service/invitation_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController customerIdController = TextEditingController();
  TextEditingController customerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset(qrImage),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              child: Column(
                children: [
                  MainTextField(
                    context: context,
                    controller: customerIdController,
                    labelText: "Enter your Id",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 32,
                  ),
                  MainTextField(
                    context: context,
                    controller: customerPasswordController,
                    labelText: "Enter your Password",
                  ),
                ],
              ),
            ),
            MainContainer(
              onTap: () async {
                CustomerModel temp = await Invitation().getOneCustomer(
                    idCustomer: customerIdController.text) as CustomerModel;

                if (temp.password.toString() ==
                    customerPasswordController.text) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenerateScreen(
                        invitationRange: temp.invitationRange!,
                        idCustomer: customerIdController.text,
                      ),
                    ),
                  );
                }
              },
              context: context,
              containerText: 'Let’s Start',
            ),
          ],
        ),
      ),
    );
  }
}
