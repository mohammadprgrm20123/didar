

import 'package:dartz/dartz.dart';

import '../../../core/domain/failure_entity.dart';
import '../data/model/add_customer_dto.dart';
import '../data/model/customer_model.dart';
import '../data/model/edit_customer_dto.dart';

abstract class CustomerRepository {


  Future<Either<FailureEntity,List<CustomerModel>>> getAllCustomer();

  Future<Either<FailureEntity,void>> createCustomer(final AddCustomerDto dto);
  Future<Either<FailureEntity,void>> editCustomer(final EditCustomerDto dto);
  Future<Either<FailureEntity,void>> deleteCustomer(final String id);
  Future<Either<FailureEntity, CustomerModel>> getCustomerDetails(final int id);



}