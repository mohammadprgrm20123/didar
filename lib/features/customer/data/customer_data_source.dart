
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_helper.dart';
import '../../../core/domain/failure_entity.dart';
import '../../../core/utils/app_constant.dart';
import 'model/customer_dto.dart';

class CustomerDataSource {
  DatabaseHelper helper;

  CustomerDataSource(this.helper);

  Future<Either<FailureEntity, dynamic>> getAllContactFromLocal() async {
    final helper = await DatabaseHelper.instance.getDataBase;

    try {
      final list = await helper.query(AppConstant.customerTable);
      return Right(list);
    } catch (e) {
      return Left(FailureEntity(error: 'مشکلی پیش آمده است', statusCode: 400));
    }
  }

  Future<Either<FailureEntity, dynamic>> createCustomer(
      final CustomerDto dto) async {
    final helper = await DatabaseHelper.instance.getDataBase;
    try {
      final list = await helper.insert(AppConstant.customerTable, dto.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore);
      return Right(list);
    } catch (e) {
      return Left(FailureEntity(error: 'مشکلی پیش آمده است', statusCode: 400));
    }
  }

  Future<Either<FailureEntity, dynamic>> editCustomer(
      final CustomerDto dto) async {
    final helper = await DatabaseHelper.instance.getDataBase;

    try {
      final list = await helper.update(AppConstant.customerTable, dto.toJson(),where: 'id= ?', whereArgs: [id]);
      return Right(list);
    } catch (e) {
      return Left(FailureEntity(error: 'مشکلی پیش آمده است', statusCode: 400));
    }
  }

  Future<Either<FailureEntity, dynamic>> deleteCustomer(final String id) async {
    final helper = await DatabaseHelper.instance.getDataBase;

    try {
      final list = await helper
          .delete(AppConstant.customerTable, where: 'id= ?', whereArgs: [id]);
      return Right(list);
    } catch (e) {
      return Left(FailureEntity(error: 'مشکلی پیش آمده است', statusCode: 400));
    }
  }

  Future<Either<FailureEntity, dynamic>> getCustomer(
      {required final int id}) async {
    final db = await helper.getDataBase;

    try {
      final result = await db.query(AppConstant.customerTable,
          where: '${AppConstant.id} = ?', whereArgs: [id]);

      return Right(result);
    } catch (e) {
      return Left(FailureEntity(error: e.toString()));
    }
  }
}
