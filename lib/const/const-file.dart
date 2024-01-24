import 'package:flutter/material.dart';

String qrImage = "images/bi_qr-code-scan.jpg";

Decoration decoration = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/home_screen.png'),
    fit: BoxFit.fill,
  ),
);

Color mainColor = Colors.blueGrey.shade600;

List<String>? customersName = ["mosab"];

class MainContainer extends StatelessWidget {
  MainContainer(
      {Key? key,
      required this.context,
      required this.containerText,
      required this.onTap})
      : super(key: key);
  BuildContext context;
  String containerText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 58,
        decoration: ShapeDecoration(
          color: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 26,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            containerText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class MainTextField extends StatelessWidget {
  MainTextField(
      {Key? key,
      required this.context,
      required this.controller,
      required this.labelText})
      : super(key: key);

  BuildContext context;
  TextEditingController controller;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: ShapeDecoration(
        color: const Color(0x1D234C4C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class MainListTitle extends StatelessWidget {
  MainListTitle(
      {required this.context,
      required this.index,
      required this.onTap,
      required this.onClear});

  BuildContext context;
  int index;
  void Function()? onTap;
  void Function()? onClear;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: ListTile(
          leading: SizedBox(
            child: Image.asset(qrImage),
            height: 35,
            width: 35,
          ),
          title: Text(
            customersName![index],
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
              onPressed: onClear,
              icon: Icon(
                Icons.delete_outline_rounded,
                color: Colors.white,
              )),
        ),
        decoration: ShapeDecoration(
          color: Color(0xD1333333),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}
