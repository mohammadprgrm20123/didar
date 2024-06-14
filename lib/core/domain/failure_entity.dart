class FailureEntity {
  final String? error;
  final int? statusCode;

  FailureEntity({
    this.statusCode,
    this.error,
  });

  factory FailureEntity.fromJson(
    final Map<String, dynamic> json,
    final int? statusCode,
  ) {
    final failure = json['error'];
    return FailureEntity(
      error: (failure is int ? failure.toString() : failure),
      statusCode: statusCode,
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'statusCode': statusCode,
      };

  @override
  String toString() => error ?? 'Something went wrong!';
}
