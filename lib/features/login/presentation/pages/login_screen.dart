import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/SignUp/presentation/bloc/signup_bloc.dart';
import 'package:my_shopping_app/features/login/domain/use_cases/login_usecase.dart';
import 'package:my_shopping_app/features/login/presentation/bloc/login_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenState == ScreenState.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
         else if (state.screenState == ScreenState.failure) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.errormsg??"",style: TextStyle(
                    fontSize: 14,
                    color: ThirdPrimary
                ),),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("okay",
                          style: TextStyle(
                              color:
                              Colors.white))),
                ],
              ),
            );
          } else if (state.screenState == ScreenState.success) {

            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.home, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key:LoginBloc.get(context).formKey ,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Group 15106.png",
                            width: 100.w, height: 150.h),
                      ],
                    ),
                    Text("Welcome !",
                        style:TextStyle(color: Colors.black,
                          fontSize: 40,
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text("sign in to continue",
                        style: TextStyle(
                          fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color:Color(0Xff000000).withOpacity(0.3))),
                    SizedBox(
                      height: 60.h,
                    ),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller:LoginBloc.get(context).emailController,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your Email";
                          }
                          final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "please enter valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("Email",
                              style: TextStyle(
                                  color: Colors.black,
                                fontSize: 16
                              )),
                          prefixIcon: Icon(Icons.email_rounded,color: Theme.of(context).colorScheme.secondary,),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:Color(0XFFD9D9D9),
                                  width: 2.w
                              ),
                              borderRadius: BorderRadius.circular(12.r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:Color(0XFFD9D9D9),
                                width: 2.w
                              ),
                              borderRadius: BorderRadius.circular(12.r)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormField(
                      controller: LoginBloc.get(context).passwordController,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),
                      obscureText:LoginBloc.get(context).secure?true:false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your password";
                        }
                        RegExp regex =
                        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Password",
                            style: TextStyle(
                              color: Colors.black,
                                fontSize: 16
                            )),
                        prefixIcon: Icon(Icons.lock,color: Theme.of(context).colorScheme.secondary,),
                        suffixIcon:IconButton(onPressed:() {
                          LoginBloc.get(context).secure=!LoginBloc.get(context).secure;
                          setState(() {
                          });
                        }, icon:Icon(LoginBloc.get(context).secure?Icons.visibility_off:Icons.visibility,color: Theme.of(context).colorScheme.secondary),),

                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  LoginBloc.get(context).add(LoginBtnClickEvent());
                                },
                                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusDirectional.circular(12.r),
                                        ))),
                                child: Text("Sign in",
                                    style: TextStyle(
                                      fontSize: 18,
                                        color: Colors.white))),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 60.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, RoutesName.signup,
                                (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Don't have an account ? ",
                                style: TextStyle(
                                  fontSize: 16,
                                    color:Colors.black87,fontWeight: FontWeight.bold)),
                            Text("Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                    color:
                                    primaryColor,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
           /* Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFF004182),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "E-mail address",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height:24.h,
                      ),
                      TextFormField(
                        controller: LoginBloc.get(context).emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your Email";
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "please enter valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:32.h,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                        controller:LoginBloc.get(context).passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your password";
                          }
                          RegExp regex =
                              RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}');
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      ElevatedButton(
                              onPressed: () {
                                LoginBloc.get(context).add(LoginBtnClickEvent());
                              },
                              style: ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                                  vertical: 14
                                )),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  shape:
                                      MaterialStatePropertyAll(RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent
                                        ),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(12),
                                  ))),
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF004182),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              )),

                      SizedBox(height: 32.h,),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutesName.signup,
                                  (route) => false);
                        },
                        child: Text(
                          "Don’t have an account? Create Account",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
          );*/
        },
      ),
    );
  }
}
