import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/profile_cell.dart';


class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ProfileCell(),
          SizedBox(height: 24.h,),
          ProfileCell(),
            SizedBox(height: 24.h,),
        ProfileCell(),
            SizedBox(height: 24.h,),
        ProfileCell(),
            SizedBox(height: 40.h,),

            Row(
              children: [
            Text("Log out",
                style: TextStyle(
                    color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )),
            Spacer(),
            IconButton(
                onPressed: () {
                  CacheData.removeData("token");
                  Navigator.pushReplacementNamed(
                      context, RoutesName.login);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
                ))
              ],
            ),
        ]
    ),
    );
  }
}
