import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/constant/app_strings.dart';
import 'package:basic_intigration/controller/send_otp_controller/send_otp_controller.dart';
import 'package:basic_intigration/widget/custom_button.dart';
import 'package:basic_intigration/widget/material_textform_field_widget.dart';
import 'package:basic_intigration/widget/sized_box.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';


class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

// he appan controller la call karynasathi vaparto 
  final SendOtpController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bodyColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameWidget(context),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textAndTextField(context),
                  SizedBoxWidget(
                    height: AppSizes.getPhoneSize(context, 150),
                  ),
                  _sendOtpWidget(context),
                ],
              ),
              const Spacer(),
             
            ],
          ),
        ),
      ),
    );
  }

  _nameWidget(BuildContext context) {
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
      ],
    );
  }

  _sendOtpWidget(BuildContext context) {
    return Obx(
      // obx appan current changes dhakhavnys sathi vaparto
      () => CustomButtonWidget(
        context: context,
        data: "Send OTP",
        onClick: () {
          // ithe appan condition use keli ahe ki number jr 10 asel tr ch send otp function la call jail other wise call nahi janar
          if (_controller.phoneController.length == 10) {
            _controller.sendOtp(
                context: context, number: _controller.phoneController.text);
          } else if (_controller.phoneController.length != 10) {}
        },
        height: AppSizes.getPhoneSize(context, 50),
        width: double.infinity,
        isInProgress: _controller.isLoading,
        borderRadius: AppSizes.getPhoneSize(context, 10),
        color: AppColors.lightWhiteColor,
        fontSize: AppSizes.getPhoneSize(context, 15),
      ),
    );
  }

  _textAndTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _loginAccountWidget(context),
        SizedBox(
          height: AppSizes.getPhoneSize(context, 25),
        ),
        MaterialTextFormFieldWidget(
          fontSize: AppSizes.getPhoneSize(context, 13),
          context: context,
          validator: (value) {
            String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
            RegExp regExp = RegExp(pattern);
            if (value!.isEmpty) {
              return AppStrings.mobileAddMessage;
            } else if (value.length != 10 || !regExp.hasMatch(value)) {
              return AppStrings.mobileValidMessage;
            }
            return null;
          },
          // hya controller ni appan number get karto 
          textEditingController: _controller.phoneController,
          inputFormatter: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly
          ],
          hintText: AppStrings.mobileAddMessage,
          hintColor: AppColors.grayColor,
          onSubmit: (value) {
            if (value.length == 10) {}
          },
        ),
      ],
    );
  }

  _loginAccountWidget(BuildContext context) {
    return TextWidget(
      context: context,
      text: AppStrings.enteryourwhatsapp,
      color: AppColors.blackColor,
      fontSize: AppSizes.getPhoneSize(context, 15),
    );
  }
}
