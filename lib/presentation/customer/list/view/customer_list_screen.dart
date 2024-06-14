import 'package:didar_challenge_test/presentation/core/widget/app_text.dart';
import 'package:didar_challenge_test/presentation/core/widget/row_builder.dart';
import 'package:didar_challenge_test/presentation/customer/list/view/tab/contacts_list_tab.dart';
import 'package:didar_challenge_test/presentation/customer/list/view/tab/user_list_tab.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const AppText(
              '',
            ),
            bottom: TabBar(
              padding: const EdgeInsets.all(8),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondary),
              tabs: const [
                Tab(
                  child: AppText('مخاطبین'),
                ),
                Tab(
                  child: AppText('کاربران'),
                ),
              ],
            ),
            elevation: 3,
          ),
          body: const Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    ContactsListTab(),
                    UserListTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
