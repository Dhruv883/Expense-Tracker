import 'package:flutter/material.dart';
import 'package:client/all.dart';

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
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Hello,\n${widget.name}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            toolbarHeight: 80,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.55),
                bottomRight: Radius.circular(35.55),
              ),
            ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 66, 34, 74),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.55),
                  topRight: Radius.circular(35.55),
                )),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Transactions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                      // Text(
                      //   "See All",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 15,
                      //     decoration: TextDecoration.underline,
                      //     decorationColor: Colors.transparent,
                      //   ),
                      //   textAlign: TextAlign.right,
                      // ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const All(),
                            ),
                          );
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.transparent,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: double.infinity,
                        child: Blocks(
                          "McDonald's\n -₹699",
                          Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: double.infinity,
                        child: Blocks(
                          "McDonald's\n -₹699",
                          Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: double.infinity,
                        child: Blocks(
                          "McDonald's\n -₹699",
                          Colors.white,
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class Blocks extends StatelessWidget {
  final String text;
  final Color color;

  const Blocks(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 93, 21, 112),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 22,
        ),
      ),
    );
  }
}
