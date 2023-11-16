import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shopping_app/config/routes/routes.dart';
import 'package:my_shopping_app/features/SignUp/presentation/bloc/signup_bloc.dart';

class SignUpScreen extends StatefulWidget{

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();

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
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        else  if (state.screenState == ScreenState.failure) {
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
            body:
               Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset("assets/images/Group 5.png"),
                        SizedBox(height: 30.h,),
                        Text("Full Name",style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller:SignupBloc.get(context).nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your name";
                            }
                            return null;
                          },
                          decoration:
                          InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("name",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text("Mobile Number",style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 15.h,),
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
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Phone"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text("E-mail address",style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 15.h,),
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
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Email",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text("Password",style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: SignupBloc.get(context).passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your password";
                            }
                            RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Password",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h,),
                        ElevatedButton(
                              onPressed: () {
                                SignupBloc.get(context).add(SignUpBtnClick());
                              },
                              style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                                      vertical:12
                                  )),
                                backgroundColor: MaterialStatePropertyAll(Colors.white),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.circular(12),
                                  ))),
                              child: Text("Sign Up",style: GoogleFonts.poppins(
                              color: Color(0xFF004182),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500
                              ),
                                ))
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
