import 'package:fast_contacts/fast_contacts.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/database/database_helper.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../features/customer/data/model/add_customer_dto.dart';
import '../../../../features/customer/data/model/customer_model.dart';
import '../../../../features/customer/domain/use_case/create_customer_use_case.dart';


@Injectable()
class ContactListTabController extends GetxController {
  RxList<CustomerModel> customerModels = <CustomerModel>[].obs;

  CreateCustomerUseCase createCustomerUseCase;

  ContactListTabController(this.createCustomerUseCase);

  Future<void> getAllContacts() async {
    await Permission.contacts.onDeniedCallback(() {
      Get.snackbar('لطفا دسترسی مورد نظر را بدهید', '');
    }).onGrantedCallback(() async {
      final contacts = await FastContacts.getAllContacts();

      final helper = await DatabaseHelper.instance.getDataBase;

      print(helper.getVersion());

      for (var e in contacts) {
        await createCustomerUseCase.call(AddCustomerDto(
            display: e.displayName, phone: e.phones.first.number));
      }
      final list = await helper.query(AppConstant.customerTable);

      customerModels.clear();
      for (final e in list) {
        print(e);
        customerModels.add(CustomerModel.fromJson(e));
      }
      customerModels.refresh();
    }).request();
  }
}
