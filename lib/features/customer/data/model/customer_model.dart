import '../../../../core/utils/app_constant.dart';

class CustomerModel {
  final int? id;
  final String display;
  final String phone;

  CustomerModel({ this.id, required this.display, required this.phone});

  factory CustomerModel.fromJson(final Map<String, dynamic> json) =>
      CustomerModel(
          id: json[AppConstant.id],
          display: json[AppConstant.displayNameColumn].toString(),
          phone: json[AppConstant.phoneNumber]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppConstant.displayNameColumn] = display;
    data[AppConstant.phoneNumber] = phone;
    return data;
  }
}
