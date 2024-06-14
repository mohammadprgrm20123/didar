import '../../../../core/utils/app_constant.dart';

class EditCustomerDto {
  final int id;
  final String display;
  final String phone;

  EditCustomerDto({
    required this.display,
    required this.phone,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppConstant.displayNameColumn] = display;
    data[AppConstant.id] = id;
    data[AppConstant.phoneNumber] = phone;
    return data;
  }
}
