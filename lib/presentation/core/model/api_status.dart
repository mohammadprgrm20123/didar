import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/failure_entity.dart';

part 'api_status.freezed.dart';

@freezed
class ApiStatus<T> with _$ApiStatus<T> {
  const ApiStatus._();

  const factory ApiStatus.idle() = _Idle;

  const factory ApiStatus.loading() = _Loading;

  const factory ApiStatus.failure(final FailureEntity message) = _Failure;

  const factory ApiStatus.success(final T result) = _Success;

  T? get valueOrNull => maybeWhen(
        orElse: () => null,
        success: (final result) => result,
      );

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );

  bool get isSuccess => maybeWhen(
    orElse: () => false,
    success: (v) => true,
  );

  void whenSuccess(final void Function(T data) onSuccess) => maybeWhen(
        orElse: () => null,
        success: (final data) => onSuccess(data),
      );
}
