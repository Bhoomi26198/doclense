import 'package:doclense/blocs/internet_bloc/internet_bloc.dart';
import 'package:doclense/blocs/internet_bloc/internet_state.dart';
import 'package:doclense/listItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var emailText = TextEditingController();
var passwordText = TextEditingController();

class Login extends StatelessWidget {
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
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainState) {
                return Text("Internet Connected");
              } else if (state is InternetLostState) {
                return Text("Internet is not connected");
              } else {
                return Text("Loding..");
              }

              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextField(
              //       keyboardType: TextInputType.emailAddress,
              //       controller: emailText,
              //       decoration: InputDecoration(
              //           hintText: "Enter Email",
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(20),
              //               borderSide:
              //                   const BorderSide(color: Colors.deepOrange))),
              //     ),
              //     Container(
              //       height: 11,
              //     ),
              //     TextField(
              //       controller: passwordText,
              //       obscureText: true,
              //       decoration: InputDecoration(
              //           hintText: "Enter Password",
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(20),
              //               borderSide: const BorderSide(color: Colors.deepOrange)),
              //           suffixIcon: IconButton(
              //             icon: const Icon(Icons.remove_red_eye),
              //             onPressed: () {},
              //           )),
              //     ),
              //     Container(
              //       margin: const EdgeInsets.only(top: 12),
              //       child: ElevatedButton(
              //           onPressed: () {
              //             Navigator.pushReplacement(context,
              //                 MaterialPageRoute(builder: (context) => HomePage()));
              //           },
              //           child: Text("Login")),
              //     ),
              //     // FaIcon(FontAwesomeIcons.amazonPay)
              //   ],
              // ),
            },
          ),
        )));
  }
}
