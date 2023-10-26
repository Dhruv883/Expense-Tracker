import 'package:client/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Signup extends StatefulWidget {
  // final String name;

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

void signup(String name, String password, String email) {
  // FirebaseDatabase.instance
  //     .ref()
  //     .child("users")
  //     .push()
  //     .set({"name": name, "password": password});
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
}

class _SignupState extends State<Signup> {
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
          "Signup",
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
                  controller: emailController,
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
                  controller: nameController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
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
                        FirebaseDatabase.instance.setPersistenceEnabled(true);
                        FirebaseDatabase.instance.ref().keepSynced(true);

                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then(
                              (value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                )
                              },
                            );
                      }
                    },
                    // },
                    child: const Text(
                      'Sign Up',
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
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
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
