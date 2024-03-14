
import 'package:basic_intigration/constant/app_enums.dart';
import 'package:basic_intigration/main.dart';
import 'package:basic_intigration/utils/api/api_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../utils/routes/routes.dart';
import '../util_controller/utils_controller.dart';
class SendOtpController extends GetxController {
  // api base la call kela ahe api manager
  final ApiBase _apiBase = ApiBase();
  //text editing controller he apan phone number get karynasathi tyar karto
  final TextEditingController _phoneController = TextEditingController();
 
 // he appan  getter tyare karto aplla data load hoto ahe ka nahi tysathi islodding and isEndotperrer he don 
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isEndOtpError = ''.obs;
  String get isEndOtpError => _isEndOtpError.value;

// he apply _phonecontroller che getter ahe tya through apan he phonecontroller chi value kute hi aceess karu shakto 
  TextEditingController get phoneController => _phoneController;

// he appli sendotp function ahe jya through apan aply api la call karto 
  sendOtp({required BuildContext context, required String number}) async {
     
    var payload = {"phoneNumber": number, "groupId": 1703228300417};
    _isLoading(true);
    await _apiBase.post(apiEndpoints.sendOTP, payload, (data) {
      _isLoading(false);
      print("successsfully login");

      // utilscontroller he ek custom snackbar ahe jo appan kuthe hi wapru shakto
      Get.find<UtilsController>().showSnackBar(
        content: data['message'],
        context: context,
        snackType: SnackType.success,
      );
      // jr api successfull zali tr appan next screen var jato gotophonscreen ya function through
      gotoPhoneScreen(context);
    }, (error) {
      Get.find<UtilsController>().showSnackBar(
        content: _isEndOtpError.value,
        context: context,
        snackType: SnackType.error,
      );
      // errer message show hoto snackbar madhe ani tasa pan 
      _isLoading(false);
      _isEndOtpError.value = error;
    });
  }
 // he cleardata he function aplly phoncontroller madhala data clear karte jeva otp successful hoto teva 
  clearData() {
    _phoneController.clear();
  }
// gottophonescreen he function appan dusrya page ver janysathi vaparto 
// hya function through appan appla phone number verifyotp screen varti send kela ahe 
  void gotoPhoneScreen(BuildContext context) {
  final phoneNumber = _phoneController.text;
  if (phoneNumber.isNotEmpty) {
    // Using GoRouter to navigate to the next screen
    context.push(Routes.otpScreen, extra: {"phoneNumber": phoneNumber});
  } else {
    print("Phone number is empty");
  }
}

}
