import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../features/customer/data/model/add_customer_dto.dart';
import '../../../core/model/api_status.dart';

abstract class ModifyCustomerController extends GetxController {
  int customerId = 0;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();

  String title = '';
  Rx<ApiStatus<void>> modifyApiStatus = const ApiStatus.idle().obs;

  Future<void> modify();
}
