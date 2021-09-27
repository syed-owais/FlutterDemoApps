import 'package:first_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool btnStateChange = false;
  final _formKey = GlobalKey<FormState>();

  moveToHomePage() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        btnStateChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        btnStateChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("User Name"),
                        hintText: "Enter username",
                      ),
                      onChanged: (value) => {
                        name = value,
                        setState(() {}),
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be left blank";
                        } else if (value != "Syed Owais") {
                          return "Wrong username.";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be left blank";
                        } else if (value.length < 8) {
                          return "Password length shuold be atleast 8";
                        } else if (value != "owais12345") {
                          return "Wrong password, please try again!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(btnStateChange ? 40 : 25),
                      color: Colors.red,
                      child: InkWell(
                        onTap: () => {moveToHomePage()},
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 40,
                          width: btnStateChange ? 40 : 130,
                          child: btnStateChange
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
