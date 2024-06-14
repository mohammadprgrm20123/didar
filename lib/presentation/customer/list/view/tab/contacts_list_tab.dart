import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../../../core/widget/app_text.dart';
import '../../../../core/widget/row_builder.dart';
import '../../controller/contact_list_tab_controller.dart';

class ContactsListTab extends GetView<ContactListTabController> {
  const ContactsListTab({super.key});

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut(ContactListTabController.new);
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.customerModels.length,
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
                                value: controller.customerModels[index].display,
                                valueStyle: Utils.buildTextStyle()
                                    .copyWith(fontWeight: FontWeight.bold),
                                titleStyle: Utils.buildTextStyle()
                                    .copyWith(fontSize: 14),
                              ),
                              RowBuilder(
                                titleFlex: 0,
                                title: 'شماره تلفن:',
                                value: controller.customerModels[index].phone,
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
                                  value: 2,
                                  child: AppText(
                                    'پیگیری ها',
                                    style: Utils.buildTextStyle()
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                            ];
                          },
                          icon: Icon(Icons.more_horiz_rounded),
                        )
                      ],
                    ),
                  ),
                ),
              ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.getAllContacts();
        },
        label: AppText('دریافت مخاطبین'),
      ),
    );
  }
}
