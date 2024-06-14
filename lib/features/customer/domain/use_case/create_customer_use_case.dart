import 'package:dartz/dartz.dart';

import '../../../../core/domain/base_use_case.dart';
import '../../../../core/domain/failure_entity.dart';
import '../../data/model/customer_dto.dart';
import '../customer_repository.dart';

class CreateCustomerUseCase extends BaseUseCase<void, CustomerDto> {
  final CustomerRepository _repository;

  CreateCustomerUseCase(this._repository);

  @override
  Future<Either<FailureEntity, void>> call(final CustomerDto param) async {
    final result = await _repository.createCustomer(param);

    return result;
  }
}
