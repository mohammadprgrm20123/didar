import 'package:dartz/dartz.dart';

import '../../../../core/domain/base_use_case.dart';
import '../../../../core/domain/failure_entity.dart';
import '../customer_repository.dart';

class DeleteCustomerUseCase extends BaseUseCase<void, int> {
  final CustomerRepository _repository;

  DeleteCustomerUseCase(this._repository);

  @override
  Future<Either<FailureEntity, void>> call(final int param) async {
    final result = await _repository.deleteCustomer(param.toString());

    return result;
  }
}
