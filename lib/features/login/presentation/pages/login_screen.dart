import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/SignUp/presentation/bloc/signup_bloc.dart';
import 'package:my_shopping_app/features/login/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

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
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
         else if (state.screenState == ScreenState.failure) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text(state.failures?.message ?? ""),
                    ));
          } else if (state.screenState == ScreenState.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.home, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFF004182),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/Group 5.png"),
                    SizedBox(
                      height: 46.h,
                    ),
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
                            RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
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
                      height: 90.h,
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
            )),
          );
        },
      ),
    );
  }
}
