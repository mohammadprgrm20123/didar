import 'package:dartz/dartz.dart';

import '../../../../core/domain/base_use_case.dart';
import '../../../../core/domain/failure_entity.dart';
import '../../data/model/customer_model.dart';
import '../customer_repository.dart';

class GetAllCustomerUseCase extends BaseUseCase<List<CustomerModel>, void> {
  final CustomerRepository _repository;

  GetAllCustomerUseCase(this._repository);

  @override
  Future<Either<FailureEntity, List<CustomerModel>>> call(final void param) async {
    final result = await _repository.getAllCustomer();

    return result;
  }
}
