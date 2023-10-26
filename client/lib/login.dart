import 'package:client/signup.dart';
import 'package:flutter/material.dart';
import 'package:client/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 34, 74),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 34, 74),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  controller: nameController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // login(nameController.text, passwordController.text);
                        FirebaseDatabase.instance.setPersistenceEnabled(true);
                        FirebaseDatabase.instance.ref().keepSynced(true);

                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: nameController.text,
                                password: passwordController.text)
                            .then(
                              (value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                      name: nameController.text,
                                    ),
                                  ),
                                )
                              },
                            );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
