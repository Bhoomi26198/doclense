import 'dart:convert';
import 'dart:developer';

import 'package:doclense/blocs/signIn/signIn_bloc.dart';
import 'package:doclense/blocs/signIn/signIn_event.dart';
import 'package:doclense/blocs/signIn/signIn_state.dart';
import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/preferences/preferences.dart';
import 'package:doclense/providers/profile_provider.dart';

import 'package:doclense/ui/listItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var emailText = TextEditingController();
var passwordText = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
SignInBloc signInBloc = SignInBloc();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const String KEYNAME = "email";
  static const String USER = 'user';
  var data = "";

  @override
  void initState() {
    super.initState();
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return "Please Enter an Email";
    }
    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  String? validatPassword(value) {
    if (value!.isEmpty) {
      return "Please Enter Password";
    }
    RegExp emailRegExp =
        //Minimum eight characters, at least one letter and one number
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please Enter Valid Password";
    }
    return null;
  }

  submitForm(context) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      signInBloc.add(SignInSubmitEvent(
          email: emailText.text, password: passwordText.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.login),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: BlocConsumer<SignInBloc, SignInState>(
          bloc: signInBloc,
          listener: (context, state) async {
            if (state is SignInSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Login Successfully"),
                    backgroundColor: Colors.green),
              );
              Provider.of<UserDetailsProvider>(context, listen: false)
                  .setUserDetails(state.signInModal!);
              await Preferences.setString(
                  USER, json.encode(state.signInModal!));
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Please enter valid email or password."),
                    backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            return Center(
                child: Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 12),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailText,
                            decoration: InputDecoration(
                                labelText: AppStrings.enterEmail,
                                hintText: AppStrings.enterEmail,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange))),
                            validator: validateEmail,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passwordText,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: AppStrings.enterPassword,
                                hintText: AppStrings.enterPassword,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange)),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  onPressed: () {},
                                )),
                            validator: validatPassword,
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: ElevatedButton(
                                onPressed: () async {
                                  var email = emailText.text;
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(KEYNAME, email);
                                  submitForm(context);
                                },
                                child: Text(
                                  AppStrings.login,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              )),
                        ],
                      ),
                    )));
          },
        ));
  }
}
