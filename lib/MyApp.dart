import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/main_cubit/main_cubit.dart';

import 'config/theming/my_theme.dart';

class MyApp extends StatelessWidget {
  String start;
   MyApp(this.start);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) =>
                MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: start,
                  onGenerateRoute: (settings) => AppRouter.onGenerate(settings),

                  theme: MyThemeData.lightTheme,
                  darkTheme: MyThemeData.darkTheme,
                ),
          );
        },
      ),
    );
  }
}