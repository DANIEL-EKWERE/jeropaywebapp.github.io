import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:databank/model/drawer_items.dart';
import 'package:flutter/material.dart';

import '../model/drawer_item.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key, required this.onSelectedItem});
  final ValueChanged<DrawerItem> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 180, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: kGrey,
              backgroundImage: AssetImage('assets/images/pic-2.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Daniel Ekwere',
              style: kEncodeSansMedium.copyWith(
                  color: kWhite,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.0),
            ),
            buildDrawerItems(context),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map(
              (e) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                onTap: () => onSelectedItem(e),
                leading: Icon(
                  e.icon,
                  color: kWhite,
                ),
                title: Text(
                  e.name,
                  style: kEncodeSansSemiBold.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                ),
              ),
            )
            .toList(),
      );
}
