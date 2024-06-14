import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../core/widget/app_button.dart';
import '../../../core/widget/app_text.dart';
import '../controller/modify_customer_controller.dart';

class ModifyCustomerScreen<T extends ModifyCustomerController>
    extends GetView<T> {
  final void Function() myController;

  const ModifyCustomerScreen({
    required this.myController,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    myController.call();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(controller.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration:  InputDecoration(
                    label: AppText('نام مشتری',style: Utils.buildTextStyle().copyWith(color: Theme.of(context).primaryColorLight),),
                    border: const OutlineInputBorder()),
              ),

              Utils.mediumGap,
              Utils.mediumGap,
              TextFormField(
                decoration:  InputDecoration(
                    label: AppText('شماره تلفن',style: Utils.buildTextStyle().copyWith(color: Theme.of(context).primaryColorLight),),
                    border: const OutlineInputBorder()),
              ),

              const Spacer(),

              AppButton(onPressed: (){},text: controller.title,)
            ],
          ),
        ),
      );
  }
}
