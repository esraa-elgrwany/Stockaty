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
              Row(
                children: [
                  Image.asset("assets/images/photo_2024-05-06_00-06-50 1.png",
                      width: 350.w, height: 350.h),
                ],
              ),
              Center(
                child: Text("Hello",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 26.sp,
                  fontWeight:FontWeight.bold,
                  color: Colors.black
                ),),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text("Welcome to your site ,your best choice for shopping,",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text("welcome to,STOKATTY",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),),
              ),
              SizedBox(
                height: 32.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.restorablePushNamedAndRemoveUntil(context,RoutesName.login,
                            (route) => false);
                  },
                  style: ButtonStyle(
                    backgroundColor:MaterialStatePropertyAll(primaryColor),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12.r),
                      ))),
                  child: Text("Log In",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white))),
              SizedBox(
                height: 24.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.restorablePushNamedAndRemoveUntil(context,RoutesName.signup,
                            (route) => false);
                  },
                  style: ButtonStyle(
                      backgroundColor:MaterialStatePropertyAll(Colors.white),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12.r),
                        side: BorderSide(
                          color: primaryColor,
                          width: 2.w
                        )
                      ))),
                  child: Text("Sign Up",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black87)))
            ],
          ),
        ),
      ),
    );
  }
}
