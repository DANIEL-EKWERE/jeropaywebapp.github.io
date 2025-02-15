import 'package:databank/backend/provider/user_details/user_details.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:databank/model/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import '../model/drawer_item.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({super.key, required this.onSelectedItem});
  final ValueChanged<DrawerItem> onSelectedItem;

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  var username;

  Future<String> gatherUserName() async {
    final usernamex = await DataBaseProvider().getUserName();
    setState(() {
      username = usernamex;
    });
    print("user name is $username method");
    return usernamex;
  }

  dynamic proImg = '';
  @override
  void initState() {
    super.initState();
    gatherUserName();
    final img = userProfile();
    setState(() {
      proImg = img;
    });
  }

  Future<void> userProfile() async {
    final image = await UserDetails().getUserProfileImage();
    setState(() {
      proImg = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 180, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundColor: purple,
                backgroundImage: NetworkImage("https://jeropay.com.ng$proImg")
                //  : Image.asset("assets/images/pic-2.png"),
                ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '$username',
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
                onTap: () => widget.onSelectedItem(e),
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
