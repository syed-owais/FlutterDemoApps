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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/imgs/login-img.png",
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
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter password",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async => {
                      setState(() {
                        btnStateChange = true;
                      }),
                      await Future.delayed(const Duration(seconds: 1)),
                      Navigator.pushNamed(context, MyRoutes.homePage)
                    },
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
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(btnStateChange ? 40 : 25),
                        color: Colors.red,
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homePage);
                  //   },
                  //   child: const Text("Login"),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: const Size(130, 40),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
