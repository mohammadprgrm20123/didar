import 'package:dartz/dartz.dart';

import 'failure_entity.dart';

abstract class BaseUseCase<S, P> {
  Future<Either<FailureEntity, S>> call(final P param);
}
