import 'package:flutter/material.dart';
import 'package:qr_invitation_app/screen/history_screen.dart';
import '../const/const-file.dart';

class GenerateScreen extends StatelessWidget {
  GenerateScreen(
      {Key? key, required this.invitationRange, required this.idCustomer})
      : super(key: key);

  TextEditingController customerController = TextEditingController();
  int invitationRange;
  String idCustomer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: decoration,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 70, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 10,
                          height: MediaQuery.of(context).size.width / 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryScreen(
                                    invitationRange: invitationRange,
                                    idCustomer: idCustomer,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                            color: mainColor,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF333333),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x99000000),
                                blurRadius: 46,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.12,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Color(0xC63B3B3B),
                        border: Border(
                          bottom: BorderSide(width: 2, color: mainColor),
                          top: BorderSide(width: 2, color: mainColor),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              child: Image.asset(qrImage),
                            ),
                            MainTextField(
                              context: context,
                              controller: customerController,
                              labelText: "Enter Guest Name",
                            ),
                            MainContainer(
                              context: context,
                              onTap: () {
                                if (customersName!.length <= invitationRange &&
                                    customerController.text.isNotEmpty) {
                                  customersName!.add(customerController.text);
                                }
                                customerController.clear();
                              },
                              containerText: 'Add Guest Name',
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
