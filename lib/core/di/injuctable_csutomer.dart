import 'package:injectable/injectable.dart';


import '../../features/customer/data/customer_data_source.dart';
import '../../features/customer/data/customer_respository_impl.dart';
import '../../features/customer/domain/customer_repository.dart';
import '../../features/customer/domain/use_case/create_customer_use_case.dart';
import '../../features/customer/domain/use_case/delete_customer_use_case.dart';
import '../../features/customer/domain/use_case/edit_customer_use_case.dart';
import '../../features/customer/domain/use_case/get_all_customer_use_case.dart';
import '../../features/customer/domain/use_case/get_customer_details_use_case.dart';
import '../database/database_helper.dart';

@module
abstract class InjectableCustomerFeature {
  CustomerDataSource get customerDataSource =>
      CustomerDataSource(DatabaseHelper.instance);

  CustomerRepository get _customerRepository =>
      CustomerRepositoryImpl(customerDataSource);

  CreateCustomerUseCase get addCustomerUseCase =>
      CreateCustomerUseCase(_customerRepository);

  EditCustomerUseCase get editCustomerUseCase =>
      EditCustomerUseCase(_customerRepository);

  GetAllCustomerUseCase get getAllCustomersUseCase =>
      GetAllCustomerUseCase(_customerRepository);

  GetCustomerDetailsUseCase get getCustomerUseCase =>
      GetCustomerDetailsUseCase(_customerRepository);

  DeleteCustomerUseCase get deleteCustomerUseCase =>
      DeleteCustomerUseCase(_customerRepository);
}
