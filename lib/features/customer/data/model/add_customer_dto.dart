import '../../../../core/utils/app_constant.dart';

class AddCustomerDto {
  final String display;
  final String phone;

  AddCustomerDto({ required this.display, required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppConstant.displayNameColumn] = display;
    data[AppConstant.phoneNumber] = phone;
    return data;
  }

}
