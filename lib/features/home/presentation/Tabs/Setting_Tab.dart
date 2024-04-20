import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 10,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Light",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Theme",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.sunny,
                      color: secondPrimary,
                      size: 30,
                    )
                  ],
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: primaryColor,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Text("Dark Mode",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary)),
                    Spacer(),
                    Switch(
                      value: MainCubit.get(context).isDark,
                      onChanged: (value) {
                        MainCubit.get(context).isDark = value;
                        if (MainCubit.get(context).isDark == true) {
                          MainCubit.get(context).changeMode(ThemeMode.dark);
                        } else {
                          MainCubit.get(context).changeMode(ThemeMode.light);
                        }
                        setState(() {});
                      },
                    )
                  ],
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: primaryColor,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Text("Chang Password",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color:secondPrimary,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: primaryColor,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Text("Log out",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary)),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          CacheData.removeData("token");
                          Navigator.pushReplacementNamed(
                              context, RoutesName.login);
                        },
                        icon: Icon(
                          Icons.logout,
                          color: secondPrimary,
                          size: 30,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
