import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/SignUp/presentation/bloc/signup_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.screenState == ScreenState.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                elevation: 0,
                title: Text("loading"),
                content: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state.screenState == ScreenState.failure) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.errormsg ?? ""),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okey",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ],
              ),
            );
          } else if (state.screenState == ScreenState.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.login, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: SignupBloc.get(context).formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Group 15106.png",
                            width: 100.w, height: 150.h),
                      ],
                    ),
                    Text("Hi !",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black,
                          fontSize: 40.sp,
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text("Creat a new account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                            color:Color(0Xff000000).withOpacity(0.3))),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFormField(
                      controller: SignupBloc.get(context).nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your user name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("User name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color: Colors.black,)),
                        prefixIcon: Icon(Icons.person_outlined,
                            color: Theme.of(context).colorScheme.secondary),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color:Color(0XFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: SignupBloc.get(context).phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your phone number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Phone",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color: Colors.black,)),
                        prefixIcon: Icon(Icons.phone,
                            color: Theme.of(context).colorScheme.secondary),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color:Color(0XFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color:Color(0XFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: SignupBloc.get(context).emailController,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color: Colors.black,)),
                        prefixIcon: Icon(Icons.email_rounded,
                            color: Theme.of(context).colorScheme.secondary),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      obscureText:
                          SignupBloc.get(context).secure ? true : false,
                      controller: SignupBloc.get(context).passwordController,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color: Colors.black,)),
                        prefixIcon: Icon(Icons.lock,
                            color: Theme.of(context).colorScheme.secondary),
                        suffixIcon: IconButton(
                          onPressed: () {
                            SignupBloc.get(context).secure =
                                !SignupBloc.get(context).secure;
                            setState(() {});
                          },
                          icon: Icon(
                              SignupBloc.get(context).secure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0XFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            SignupBloc.get(context).add(SignUpBtnClick());
                          },
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal:140, vertical:16),
                              ),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(12.r),
                              ))),
                          child: Text("Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white))),
                    ),
                    SizedBox(height: 40.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.login, (route) => false);
                      },
                      child: Row(
                        children: [
                          Text("Already have an account ? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sign in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
