import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/customer/data/model/customer_dto.dart';
import '../../../core/model/api_status.dart';

abstract class ModifyCustomerController extends GetxController {

  String title = '';
  Rx<ApiStatus<void>> modifyApiStatus = const ApiStatus.idle().obs;

  Future<void> modify(final CustomerDto dto);
}
