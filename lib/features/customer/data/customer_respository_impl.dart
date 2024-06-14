import 'package:dartz/dartz.dart';
import '../../../core/domain/failure_entity.dart';
import '../domain/customer_repository.dart';
import 'customer_data_source.dart';
import 'model/add_customer_dto.dart';
import 'model/customer_model.dart';
import 'model/edit_customer_dto.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerDataSource _dataSource;

  CustomerRepositoryImpl(this._dataSource);

  @override
  Future<Either<FailureEntity, void>> createCustomer(
      final AddCustomerDto dto) async {
    final result = await _dataSource.createCustomer(dto);

    return result.fold(Left.new, (final value) => const Right(null));
  }

  @override
  Future<Either<FailureEntity, void>> deleteCustomer(final String id) async {
    final result = await _dataSource.deleteCustomer(id);

    return result.fold(Left.new, (final value) => const Right(null));
  }

  @override
  Future<Either<FailureEntity, void>> editCustomer(
      final EditCustomerDto dto) async {
    final result = await _dataSource.editCustomer(dto);

    return result.fold(Left.new, (final value) => const Right(null));
  }

  @override
  Future<Either<FailureEntity, List<CustomerModel>>> getAllCustomer() async {
    final result = await _dataSource.getAllContactFromLocal();
    final List<CustomerModel> customerModels = [];
    return result.fold(Left.new, (final value) {
      for (final e in value as List) {
        print(e);
        customerModels.add(CustomerModel.fromJson(e));
      }

      return Right(customerModels);
    });
  }

  @override
  Future<Either<FailureEntity, CustomerModel>> getCustomerDetails(final int id) async {
    final result = await _dataSource.getCustomer(id: id);

    return result.fold((error) => Left(FailureEntity(error: 'Error')), (r) {
      if (r.isEmpty) {
        return Left(FailureEntity(error: 'Not Exits'));
      }
      return Right(CustomerModel.fromJson(r.first));
    });
  }
}
