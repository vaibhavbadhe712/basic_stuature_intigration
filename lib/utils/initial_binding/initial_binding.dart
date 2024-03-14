

import 'package:basic_intigration/controller/util_controller/utils_controller.dart';
import 'package:get/get.dart';

import '../../controller/homepagecontroller/home_page_controller.dart';
import '../../controller/send_otp_controller/send_otp_controller.dart';
import '../../controller/verify_otp_controller/verify_otp_controller.dart';

void initialBiniding() {
  Get.lazyPut<UtilsController>(() => UtilsController());
Get.lazyPut<HomePageControler>(() => HomePageControler());
Get.lazyPut<SendOtpController>(() => SendOtpController());
Get.lazyPut<VerifyOtpController>(() => VerifyOtpController());
  
}
