import 'package:injectable/injectable.dart';

import '../../../../features/customer/data/model/customer_dto.dart';
import '../../../../features/customer/domain/use_case/create_customer_use_case.dart';
import '../../../core/model/api_status.dart';
import 'modify_customer_controller.dart';

@injectable
class CreateCustomerController extends ModifyCustomerController {
  final CreateCustomerUseCase createCustomerUseCase;

  CreateCustomerController(this.createCustomerUseCase);


  @override
  void onInit() {
    title = 'افزودن مشتری';
    super.onInit();
  }


  @override
  Future<void> modify(final CustomerDto dto) async {
    modifyApiStatus.value = const ApiStatus.loading();
    final result = await createCustomerUseCase.call(dto);

    result.fold(
        (final error) => modifyApiStatus.value = ApiStatus.failure(error),
        (final value) => modifyApiStatus.value = ApiStatus.success(value));
  }
}
