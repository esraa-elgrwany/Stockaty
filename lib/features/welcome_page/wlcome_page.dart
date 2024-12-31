import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/core/utils/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Group 15106.png",
                      width: 100.w, height: 150.h),
                ],
              ),
              Image.asset("assets/images/photo_2024-05-06_00-06-50 1.png",
                  width: 350.w, height: 390.h),
              Center(
                child: Text("Hello",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 26,
                  fontWeight:FontWeight.bold,
                  color: Colors.black
                ),),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text("Welcome to your site ,your best choice for shopping,",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text("welcome to,Stokatty",style:TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.restorablePushNamedAndRemoveUntil(context,RoutesName.login,
                                    (route) => false);
                          },
                          style: ButtonStyle(
                            backgroundColor:MaterialStatePropertyAll(primaryColor),
                              padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(12.r),
                              ))),
                          child: Text("Log In",
                              style: TextStyle(
                                  color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.restorablePushNamedAndRemoveUntil(context,RoutesName.signup,
                                    (route) => false);
                          },
                          style: ButtonStyle(
                              backgroundColor:MaterialStatePropertyAll(Colors.white),
                              padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(12.r),
                                side: BorderSide(
                                  color: primaryColor,
                                  width: 1.w
                                )
                              ))),
                          child: Text("Sign Up",
                              style: TextStyle(
                                      color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600

                              ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
