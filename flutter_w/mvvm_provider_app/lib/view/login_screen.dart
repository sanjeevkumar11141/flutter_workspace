import 'package:flutter/material.dart';
import 'package:mvvm_provider_app/utils/route/routes_name.dart';
import 'package:mvvm_provider_app/utils/utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: InkWell(
        onTap: (){
          Utils.toastMassage("Toast Massage Here");
        },
        child: Center(child: Text("Click For Home Screen")),
      )
    );
  }
}
