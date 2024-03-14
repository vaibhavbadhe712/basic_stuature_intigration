import 'package:basic_intigration/constant/app_enums.dart';
import 'package:basic_intigration/controller/util_controller/utils_controller.dart';
import 'package:basic_intigration/main.dart';
import 'package:basic_intigration/utils/api/api_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/preferences/local_preferences.dart';

class VerifyOtpController extends GetxController {
  // api base la call kela ahe api manager
  final ApiBase _apiBase = ApiBase();
   //text editing controller he  otp number get karynasathi tyar karto
  final TextEditingController _verifyOtpController = TextEditingController();
  TextEditingController get verifyOtpController => _verifyOtpController;
   // he appan  getter tyare karto aplla data load hoto ahe ka nahi tysathi islodding and isEndotperrer he don 

  final _isLoading = false.obs;
  bool get isLoadding => _isLoading.value;
  final _isEndOtpError = ''.obs;
  String get isEndOtpError => _isEndOtpError.value;
  // he appli verifyotp function ahe jya through apan aply api la call karto 

  void verifyOtp({
    required BuildContext context,
    required String number,
    required int otp,
  }) async {
    var payload = {"phoneNumber": number, "otp": otp};
    _isLoading(true);

    await _apiBase.post(apiEndpoints.verifyOtp, payload, (data) {
      _isLoading(false);
            // utilscontroller he ek custom snackbar ahe jo appan kuthe hi wapru shakto

      Get.find<UtilsController>().showSnackBar(
        content: data['message'],
        context: context,
        snackType: SnackType.success,
      );  
          // jr api successfull zali tr appan next screen var jato gotophonscreen ya function through
clearData();

// he if condition asi ahe ki jeva appla userexists true jeva asto teva verifyotp che token he aply localStorageUtils madhe store hote 
      if (data["data"]["userExists"] == true) {
        LocalStorageUtils.saveUserDetails(data['token']);
        // gotoOrgScreen(context);
      } else {
        _isLoading(false);

        _isEndOtpError.value = "Please Enter Valid Phone Number ";
        Get.find<UtilsController>().showSnackBar(
          content: _isEndOtpError.value,
          context: context,
          snackType: SnackType.error,
        );
      }
    }, (error) {
      Get.find<UtilsController>().showSnackBar(
        content: error,
        context: context,
        snackType: SnackType.error,
      );
      _isLoading(false);
      _isEndOtpError.value = error;
    });
  }
 // he cleardata he function aplly verify otp controller madhala data clear karte jeva otp successful hoto teva 

  clearData() {
    _verifyOtpController.clear();
  }
}
