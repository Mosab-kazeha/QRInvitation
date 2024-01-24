import 'package:dio/dio.dart';

abstract class Service {
  Dio dio = Dio();
  String url =
      "https://65ae1a561dfbae409a73f4b2.mockapi.io/invitation/qr/customer";
  String guestsName = "guestsName";
  late Response response;
}
