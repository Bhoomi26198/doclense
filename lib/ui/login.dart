import 'package:doclense/blocs/internet_bloc/internet_bloc.dart';
import 'package:doclense/blocs/internet_bloc/internet_state.dart';
import 'package:doclense/blocs/login/login_bloc.dart';
import 'package:doclense/blocs/login/login_event.dart';
import 'package:doclense/blocs/login/login_state.dart';

import 'package:doclense/ui/listItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var emailText = TextEditingController();
var passwordText = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          width: 300,
          margin: const EdgeInsets.only(top: 12),
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Internet Connected"),
                      backgroundColor: Colors.green),
                );
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Internet not Connected"),
                      backgroundColor: Colors.red),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginEmailChangesEvent(emailText.text));
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailText,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange))),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return Text(
                          state.errorMsg,
                          style: const TextStyle(color: Colors.red),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    onChanged: (value) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginPasswordChangesEvent(passwordText.text));
                    },
                    controller: passwordText,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.deepOrange)),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {},
                        )),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return Text(
                          state.errorMsg,
                          style: const TextStyle(color: Colors.red),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                backgroundColor: state is LoginValidState
                                    ? Colors.blue[800]
                                    : Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  // FaIcon(FontAwesomeIcons.amazonPay)
                ],
              );
            },
          ),
        )));
  }
}
