import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lesson67/AuthUserFairbases.dart';
import 'package:lesson67/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Authuserfairbases authuserfairbases = Authuserfairbases();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? email;
  String? password;

  submit() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await authuserfairbases.login(email: email!, password: password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.abc,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "email",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'email kriting';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    email = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "password",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'password kriting';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    password = newValue;
                  },
                ),
                FilledButton(
                  onPressed: submit,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Login"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistPage()));
                  },
                  child: const Text("register page"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
