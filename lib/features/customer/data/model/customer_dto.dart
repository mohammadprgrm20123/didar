import '../../../../core/utils/app_constant.dart';

class CustomerDto {
  final String id;
  final String display;
  final String phone;

  CustomerDto({required this.id, required this.display, required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppConstant.id] = id;
    data[AppConstant.displayNameColumn] = display;
    data[AppConstant.phoneNumber] = phone;
    return data;
  }
}
