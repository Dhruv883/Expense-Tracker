import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.name});
  final String name;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Hello,\nVedant Chavan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            toolbarHeight: 80,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55.55),
                    bottomRight: Radius.circular(55.55))),
            backgroundColor: const Color.fromARGB(255, 66, 34, 74),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    )),
              ),
            ],
          )),
    );
  }
}
