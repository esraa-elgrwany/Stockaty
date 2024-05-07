import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
import 'package:my_shopping_app/features/home/presentation/widgets/profile_cell.dart';
import 'package:my_shopping_app/features/main_cubit/main_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.red)),
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
