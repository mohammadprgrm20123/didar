import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../core/widget/app_text.dart';
import '../../../../core/widget/row_builder.dart';
import '../../../modify/controller/create_customer_controller.dart';
import '../../../modify/view/modify_customer_screen.dart';

class UserListTab extends StatelessWidget {
  const UserListTab({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: ListView.builder(
            itemBuilder: (final c, final index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.tertiaryContainer),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                RowBuilder(
                                  titleFlex: 0,
                                  title: 'نام مشتری:',
                                  value: 'محمد کاظمی نژاد',
                                  valueStyle: Utils.buildTextStyle()
                                      .copyWith(fontWeight: FontWeight.bold),
                                  titleStyle: Utils.buildTextStyle()
                                      .copyWith(fontSize: 14),
                                ),
                                RowBuilder(
                                  titleFlex: 0,
                                  title: 'شماره تلفن:',
                                  value: '09309103564',
                                  valueStyle: Utils.buildTextStyle()
                                      .copyWith(fontWeight: FontWeight.bold),
                                  titleStyle: Utils.buildTextStyle()
                                      .copyWith(fontSize: 14),
                                ),
                                Utils.mediumGap,
                              ],
                            ),
                          ),
                          PopupMenuButton<int>(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            itemBuilder: (final BuildContext context) {
                              return [
                                PopupMenuItem<int>(
                                    value: 0,
                                    child: AppText(
                                      'ویرایش',
                                      style: Utils.buildTextStyle().copyWith(
                                          fontWeight: FontWeight.bold),
                                    )),
                                PopupMenuItem<int>(
                                    value: 1,
                                    child: AppText(
                                      'حذف',
                                      style: Utils.buildTextStyle().copyWith(
                                          fontWeight: FontWeight.bold),
                                    )),
                                PopupMenuItem<int>(
                                    value: 2,
                                    child: AppText(
                                      'پیگیری ها',
                                      style: Utils.buildTextStyle().copyWith(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ];
                            },
                            icon: const Icon(Icons.more_horiz_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => ModifyCustomerScreen<CreateCustomerController>(
                  myController: () =>
                      Get.lazyPut<CreateCustomerController>(getIt),
                ));
          },
          child: const Icon(Icons.add),
        ),
      );
}
