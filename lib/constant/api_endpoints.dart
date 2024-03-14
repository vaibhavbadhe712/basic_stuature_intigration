import '../models/api_base_model.dart';

class ApiEndPoints {
  ApiBaseModel? apiBaseModel;

  ApiEndPoints({this.apiBaseModel}) {
    if (apiBaseModel == null) {}
  }

  late String baseUrl = apiBaseModel?.commerceUrl ?? "";
  late String authBaseUrl = apiBaseModel?.authUrl ?? "";
  late String gatewayBaseUrl = apiBaseModel?.gatewayUrl ?? "";
  late String memberBaseUrl = apiBaseModel?.memberUrl ?? "";
  late String paymentBaseUrl = apiBaseModel?.paymentUrl ?? "";
  late String imageUploadBaseUrl = apiBaseModel?.imageUploadUrl ?? "";
  late String imageResizeBaseUrl = apiBaseModel?.imageResizeUrl ?? "";
  late String version = apiBaseModel?.version ?? "";

  // Send OTP
  late String sendOTP = "${gatewayBaseUrl}authgw/sendotp";
  late String verifyOtp = "${gatewayBaseUrl}auth/auth/validateOtp";
  late String refreshToken = "${gatewayBaseUrl}authgw/refresh-token";
  late String getAllGroup = "${authBaseUrl}usergroup/all/";
  late String leaveList = "${gatewayBaseUrl}peopleManagement/leave/";
  late String leaveApprovelBaseUrl =
      "https://so1h005xk4.execute-api.ap-south-1.amazonaws.com/";
  late String leaveApprovel = "peopleManagement/members/all/getByGroupId/";
  late String leaveListe =
      "${gatewayBaseUrl}peopleManagement/leave/";
  late String attandanceShow="${gatewayBaseUrl}peopleManagement/attendance/attendance/group";

  get groupId => 1703228300417;
}
