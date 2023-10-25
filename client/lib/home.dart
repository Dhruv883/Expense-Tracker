import 'package:flutter/material.dart';
import 'package:client/all.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.name});
  final String name;
  @override
  State<Home> createState() => _HomeState();
}

void addModal() {}

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
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
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
                    height: 25,
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
                    height: 25,
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
                    height: 25,
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
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSimpleModalDialog(context);
          },
          tooltip: 'Add Transaction',
          backgroundColor: const Color.fromARGB(255, 93, 21, 112),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
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

_showSimpleModalDialog(BuildContext context) {
  String? title = "";
  double amount = 0.0;
  String? selectedAction = "Withdraw"; // Default choice

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 450),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Transaction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    amount = double.tryParse(value) ?? 0.0;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Transaction Type",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: "Withdraw",
                      groupValue: selectedAction,
                      onChanged: (value) {
                        selectedAction = value;
                      },
                    ),
                    const Text("Withdraw"),
                    Radio(
                      value: "Deposit",
                      groupValue: selectedAction,
                      onChanged: (value) {
                        selectedAction = value;
                      },
                    ),
                    const Text("Deposit"),
                    const SizedBox(height: 20),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Title: $title");
                        print("Amount: $amount");
                        print("Action: $selectedAction");

                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text("ADD"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
