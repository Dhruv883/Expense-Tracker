import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

class All extends StatefulWidget {
  // final String name;

  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final List<String> sampleItems = [
    "McDonald's\n -₹699",
    "Burger King\n -₹599",
    "Pizza Hut\n -₹799",
    "KFC\n -₹649",
    "Subway\n -₹499",
    "Domino's\n -₹599",
    "Starbucks\n -₹349",
    "Taco Bell\n -₹699",
    "Wendy's\n -₹549",
    "In-N-Out\n -₹899",
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> sampleItems = [
      "McDonald's\n - ₹699",
      "McDonald's\n - ₹699",
      "McDonald's\n - ₹699",
      "Subway\n - ₹499",
      "Subway\n - ₹499",
      "Subway\n - ₹499",
      "Subway\n - ₹499",
      "Domino's\n - ₹599",
      "Domino's\n - ₹599",
      "Domino's\n - ₹599",
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 34, 74),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 93, 21, 112),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.55),
            bottomRight: Radius.circular(10.55),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: sampleItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: double.infinity,
                child: Blocks(sampleItems[index], Colors.white),
              ),
            ),
          );
        },
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
