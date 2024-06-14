import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      );
  }
}
