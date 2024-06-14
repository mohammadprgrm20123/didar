import 'package:get/get.dart';

import '../../../../features/customer/domain/use_case/delete_customer_use_case.dart';
import '../../../../features/customer/domain/use_case/edit_customer_use_case.dart';
import '../../../../features/customer/domain/use_case/get_all_customer_use_case.dart';

class UserListController extends GetxController {
  DeleteCustomerUseCase deleteCustomerUseCase;
  EditCustomerUseCase editCustomerUseCase;
  GetAllCustomerUseCase getAllCustomerUseCase;

  UserListController(this.getAllCustomerUseCase, this.editCustomerUseCase,
      this.deleteCustomerUseCase);





}
