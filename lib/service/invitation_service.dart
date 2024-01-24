import 'package:qr_invitation_app/const/const-file.dart';
import 'package:qr_invitation_app/model/customer_model.dart';
import 'package:qr_invitation_app/model/error_model.dart';
import 'package:qr_invitation_app/model/exception_model.dart';
import 'package:qr_invitation_app/model/guest_model.dart';
import 'package:qr_invitation_app/model/result_model.dart';
import 'package:qr_invitation_app/service/service.dart';

abstract class InvitationService extends Service {
  Future<ResultModel> getOneCustomer({required String idCustomer});
  sendTheInvitation({required String idCustomer, required GuestModel model});
}

class Invitation extends InvitationService {
  @override
  Future<ResultModel> getOneCustomer({required String idCustomer}) async {
    try {
      response = await dio.get("$url/$idCustomer");

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        CustomerModel result = CustomerModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(message: response.headers.map.toString());
      }
    } catch (e) {
      return ExceptionModel(message: e.toString());
    }
  }

  @override
  sendTheInvitation(
      {required String idCustomer, required GuestModel model}) async {
    response =
        await dio.post("$url/$idCustomer/$guestsName", data: model.toJson());
  }
}
