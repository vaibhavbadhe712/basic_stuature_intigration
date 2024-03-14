
import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/constant/app_strings.dart';
import 'package:basic_intigration/controller/verify_otp_controller/verify_otp_controller.dart';
import 'package:basic_intigration/widget/custom_button.dart';
import 'package:basic_intigration/widget/custom_divider.dart';
import 'package:basic_intigration/widget/sized_box.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  
  const VerifyOtpScreen({Key? key, this.phoneNumber}) : super(key: key);
  // hya phone number madhe appla to number alla ahe jya number ni appan login karnar ahe to 
  final String? phoneNumber;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  // ha appl verifyotp controller ha otp number ghenyasathi
  
  
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final VerifyOtpController _otpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bodyColor,
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nameWidget(context),
                    _loginAccountWidget(context),
                    _verifyOtpScreen(context),
                  ],
                ),
              ),
            )));
  }

  _loginAccountWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          context: context,
          text: 'Enter OTP Received On WhatsApp',
          color: AppColors.blackColor,
          fontSize: AppSizes.getPhoneSize(context, 15),
        ),
        SizedBoxWidget(
          height: AppSizes.getPhoneSize(context, 22),
        ),
        _otpTextField(context),
      ],
    );
  }

  _verifyOtpScreen(BuildContext context) {
    return Obx(
      () => CustomButtonWidget(
        borderRadius: AppSizes.getPhoneSize(context, 30),
        width: MediaQuery.of(context).size.width,
        height: AppSizes.getPhoneSize(context, 50),
        color: AppColors.lightWhiteColor,
        fontSize: AppSizes.getPhoneSize(context, 15),
        context: context,
        // inprogress he appan is lodding kela ahe jo pryant api progress madhe ahe to pryant thithe circularprogress indicatior firat rahate
        isInProgress: _otpController.isLoadding,
        data: 'Verify OTP',
        onClick: () {
          // ithe appan condition use kali ahe jr number emty asel tr function la call nahi honat
          // ani jr ok asel tr _otpController .verifyotp function la call honar
          if (_fromKey.currentState!.validate()) {
            // ithe function call ahe 
            _otpController.verifyOtp(
                context: context,
                // ha number appla phonenumber ahe jo appan route through ghetla ahe 
                number: widget.phoneNumber.toString(),
                // int.parse he function appan otp la int madhe convert karnyasathi varpla ahe 
                otp: int.parse(_otpController.verifyOtpController.text));
          }
        },
      ),
    );
  }

  Widget _otpTextField(BuildContext context) {
    return Column(
      children: [
        Pinput(
          obscureText: false,
          //hya controller ni appan type kelela otp gheto
          controller: _otpController.verifyOtpController,
          keyboardType: TextInputType.number,
          length: 6,
          defaultPinTheme: PinTheme(
            width: AppSizes.getPhoneSize(context, 45),
            height: AppSizes.getPhoneSize(context, 45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: AppColors.DarkGrayColor)),
          ),
          focusedPinTheme: PinTheme(
            width: AppSizes.getPhoneSize(context, 45),
            height: AppSizes.getPhoneSize(context, 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1, color: AppColors.dividerColor),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: AppSizes.getPhoneSize(context, 45),
            height: AppSizes.getPhoneSize(context, 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1, color: AppColors.DarkGrayColor),
            ),
          ),
          showCursor: true,
          validator: (String? value) {
            if (value?.length != 6 && value!.length < 6) {
              return "Please enter the 6 digit otp";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _nameWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          context: context,
          text: AppStrings.welcome,
          color: AppColors.grayColor,
          fontSize: AppSizes.getPhoneSize(context, 12),
        ),
        TextWidget(
          context: context,
          text: AppStrings.guest,
          color: AppColors.blackColor,
          fontSize: AppSizes.getPhoneSize(context, 18),
        ),
        CustomDivider(context: context),
      ],
    );
  }
}
