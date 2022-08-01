import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();

  var number1 = 0, number2 = 0, sum = 0;
  void doAddition() {
    setState(() {
      number1 = int.parse(t1.text);
      number2 = int.parse(t2.text);

      sum = number1 + number2;
    });
  }

  void doSubstract() {
    setState(() {
      number1 = int.parse(t1.text);
      number2 = int.parse(t2.text);

      sum = number1 - number2;
    });
  }

  void doMulti() {
    setState(() {
      number1 = int.parse(t1.text);
      number2 = int.parse(t2.text);

      sum = number1 * number2;
    });
  }

  void doDivision() {
    setState(() {
      number1 = int.parse(t1.text);
      number2 = int.parse(t2.text);

      sum = number1 ~/ number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Simple Calculator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Output:$sum",
              style: const TextStyle(color: Colors.red, fontSize: 40),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: t1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  label: const Text('first number'),
                  hintText: 'Enter the first number'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: t2,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  label: const Text('second number'),
                  hintText: "Enter the second number"),
            ),
            const SizedBox(height: 8, width: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: doAddition,
                  child: const Text("+"),
                ),
                const SizedBox(height: 8, width: 8),
                ElevatedButton(
                  onPressed: doSubstract,
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 8, width: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: doMulti,
                  child: const Text("*"),
                ),
                const SizedBox(height: 8, width: 8),
                ElevatedButton(
                  onPressed: doDivision,
                  child: const Text("/"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
