import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../core/widget/app_text.dart';
import '../../../../core/widget/row_builder.dart';
import '../../controller/contact_list_tab_controller.dart';
import '../customer_list_screen.dart';

class ContactsListTab extends GetView<ContactListTabController> {
  const ContactsListTab({super.key});

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut<ContactListTabController>(getIt);
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
        onPressed: () async {
          await Permission.phone.request();
          final service = FlutterBackgroundService();

          await service.configure(
            androidConfiguration: AndroidConfiguration(
              onStart: onStart,
              autoStart: true,
              isForegroundMode: true,
              foregroundServiceNotificationId: 888,
            ),
            iosConfiguration: IosConfiguration(),
          );
          await service.startService();
        },
        label: AppText('دریافت مخاطبین'),
      ),
    );
  }
}

@pragma('vm:entry-point')
void onStart(final ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  PhoneState.stream.listen((final event) {
    print('phone state');
    print(event.number);
    print(event.status.name);

    if (event.status == PhoneStateStatus.CALL_ENDED) {
      createNewNotification();
    }
  });
}

Future<void> createNewNotification() async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) return;

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'basic_channel',
          title: 'Huston! The eagle has landed!',
          body:
              "A small step for a man, but a giant leap to Flutter's community!",
          bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
          largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
          notificationLayout: NotificationLayout.Default,
          payload: {'notificationId': '1234567890'}),
      actionButtons: [
        NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
        NotificationActionButton(
            key: 'REPLY',
            label: 'Reply Message',
            requireInputText: true,
            actionType: ActionType.SilentAction),
        NotificationActionButton(
            key: 'DISMISS',
            label: 'Dismiss',
            actionType: ActionType.DismissAction,
            isDangerousOption: true)
      ]);
}
