import 'package:dartz/dartz.dart';

import '../../../../core/domain/base_use_case.dart';
import '../../../../core/domain/failure_entity.dart';
import '../../data/model/customer_model.dart';
import '../customer_repository.dart';

class GetCustomerDetailsUseCase extends BaseUseCase<CustomerModel, int> {
  final CustomerRepository _repository;

  GetCustomerDetailsUseCase(this._repository);

  @override
  Future<Either<FailureEntity, CustomerModel>> call(final int param) async {
    final result = await _repository.getCustomerDetails(param);

    return result;
  }
}
