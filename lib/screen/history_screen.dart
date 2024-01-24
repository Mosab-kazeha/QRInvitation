import 'package:flutter/material.dart';
import 'package:qr_invitation_app/const/const-file.dart';
import 'package:qr_invitation_app/model/guest_model.dart';
import 'package:qr_invitation_app/screen/show_qr_screen.dart';
import 'package:qr_invitation_app/service/invitation_service.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen(
      {Key? key, required this.invitationRange, required this.idCustomer})
      : super(key: key);

  int invitationRange;
  String idCustomer;
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.width / 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.logout),
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
            Expanded(
              child: ListView.builder(
                itemCount: customersName!.length,
                itemBuilder: (context, index) {
                  if (customersName!.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: MainListTitle(
                        onClear: () {
                          setState(() {
                            customersName!.removeAt(index);
                          });
                        },
                        context: context,
                        index: index,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowQRScreen(
                                customerName: customersName![index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MainContainer(
                context: context,
                containerText: "Send The Invitation",
                onTap: () {
                  if (customersName!.length <= widget.invitationRange) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            "you Need To Complete Apply Your Invitation"),
                        backgroundColor: Colors.pink.withOpacity(0.7),
                      ),
                    );
                  } else {
                    for (var element in customersName!) {
                      Invitation().sendTheInvitation(
                          idCustomer: widget.idCustomer,
                          model: GuestModel(name: element));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
