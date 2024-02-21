import 'package:doclense/constants/app_strings.dart';

import 'package:doclense/ui/listItem.dart';
import 'package:flutter/material.dart';

var emailText = TextEditingController(text: "bhoomi@mail.com");
var passwordText = TextEditingController(text: "123456");
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});

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

  submitForm(context) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
        body: Center(
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
                                borderSide:
                                    const BorderSide(color: Colors.deepOrange)),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () {},
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: ElevatedButton(
                            onPressed: () {
                              submitForm(context);
                            },
                            child: Text(
                              AppStrings.login,
                              style: const TextStyle(fontSize: 18),
                            ),
                          )),
                    ],
                  ),
                ))));
  }
}
