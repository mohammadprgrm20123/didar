import 'package:dartz/dartz.dart';

import '../../../../core/domain/base_use_case.dart';
import '../../../../core/domain/failure_entity.dart';
import '../../data/model/add_customer_dto.dart';
import '../../data/model/edit_customer_dto.dart';
import '../customer_repository.dart';

class EditCustomerUseCase extends BaseUseCase<void, EditCustomerDto> {
  final CustomerRepository _repository;

  EditCustomerUseCase(this._repository);

  @override
  Future<Either<FailureEntity, void>> call(final EditCustomerDto param) async {
    final result = await _repository.editCustomer(param);

    return result;
  }
}
