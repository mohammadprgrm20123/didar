import 'package:injectable/injectable.dart';

import '../../../../features/customer/data/model/customer_dto.dart';
import '../../../../features/customer/domain/use_case/edit_customer_use_case.dart';
import '../../../core/model/api_status.dart';
import 'modify_customer_controller.dart';

@injectable
class EditCustomerController extends ModifyCustomerController {
  final EditCustomerUseCase editCustomerUseCase;

  EditCustomerController(this.editCustomerUseCase);

  @override
  void onInit() {
    title ='ویرایش مشتری';
    super.onInit();
  }

  @override
  Future<void> modify(final CustomerDto dto) async {
    modifyApiStatus.value = const ApiStatus.loading();
    final result = await editCustomerUseCase.call(dto);

    result.fold(
        (final error) => modifyApiStatus.value = ApiStatus.failure(error),
        (final value) => modifyApiStatus.value = ApiStatus.success(value));
  }
}
