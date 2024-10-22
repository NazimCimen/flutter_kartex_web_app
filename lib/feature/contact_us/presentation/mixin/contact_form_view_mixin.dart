import 'package:flutter/material.dart';
import 'package:kartex_web/feature/contact_us/service/contact_us_service.dart';
import 'package:kartex_web/product/constants/string_constants.dart';
import 'package:kartex_web/feature/contact_us/presentation/view/contact_form_view.dart';

mixin ContactFromViewMixin on State<ContactFromView> {
  late final TextEditingController nameController;
  late final TextEditingController mailController;
  late final TextEditingController msgController;
  late final AutovalidateMode validateMode;
  late final GlobalKey<FormState> formKey;
  late final ContactUsService service;
  String? feedbackMessage;
  bool isLoading = false;
  bool sendMailSucces = false;

  @override
  void initState() {
    nameController = TextEditingController();
    mailController = TextEditingController();
    msgController = TextEditingController();
    validateMode = AutovalidateMode.disabled;
    formKey = GlobalKey<FormState>();
    service = ContactUsServiceImpl();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    msgController.dispose();
    super.dispose();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> sendMessageButton() async {
    final isValidate = formKey.currentState?.validate();
    if (isValidate != true) {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    } else {
      changeLoading();
      final result = await service.sendEmailMessage(
        name: nameController.text,
        msg: msgController.text,
        mail: msgController.text,
      );
      if (result) {
        feedbackMessage = StringConstants.form_succes_msg;
        nameController.clear();
        mailController.clear();
        msgController.clear();
        sendMailSucces = true;
      } else {
        feedbackMessage = StringConstants.form_fail_msg;
        sendMailSucces = false;
      }
      changeLoading();
    }
  }
}
